# Automatické spouštění úloh pomocí `cron`

`cron` umožňuje automatické spouštění příkazů nebo skriptů v nastavený čas.

## 🛠️ Instalace cronu na Arch Linuxu

Arch Linux ve výchozím stavu `cron` neobsahuje.
Doporučený balíček je **`cronie`**, který poskytuje `crontab` i `cron` službu pod `systemd`.

### Instalace:

```bash
sudo pacman -S cronie
```

### Aktivace služby:

```bash
sudo systemctl enable --now cronie
```

Zkontroluj, že běží:

```bash
systemctl status cronie
```

> Pokud služba neběží, `crontab` úlohy se vůbec nebudou spouštět.

---

## 🧭 Základní syntaxe

Každý řádek v `crontab` má tento formát:

```cron
# ┌───────────── minuta (0 - 59)
# │ ┌───────────── hodina (0 - 23)
# │ │ ┌───────────── den v měsíci (1 - 31)
# │ │ │ ┌───────────── měsíc (1 - 12)
# │ │ │ │ ┌───────────── den v týdnu (0 - 7) (0 a 7 = neděle)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * příkaz k provedení
```

---

## 🧮 Význam jednotlivých polí

| Pole           | Rozsah       | Popis                                |
|----------------|--------------|---------------------------------------|
| **Minuta**     | `0-59`       | Minuta, kdy se má úloha spustit       |
| **Hodina**     | `0-23`       | Hodina ve 24h formátu                 |
| **Den měsíce** | `1-31`       | Den v měsíci                          |
| **Měsíc**      | `1-12`       | Měsíc (`1` = leden, `12` = prosinec)  |
| **Den týdne**  | `0-7`        | Den v týdnu (`0` a `7` = neděle)      |
| **Příkaz**     | —            | Úplná cesta ke skriptu/příkazu        |

> Použij `*` pro “každou hodnotu”.  
> Např. `* * * * *` = každou minutu.

---

## 💡 Ukázky použití

```cron
# Každý den v 6:00 spustit zálohovací skript
0 6 * * * /home/user/scripts/backup.sh

# Každých 15 minut kontrola stavu
*/15 * * * * /home/user/scripts/check_status.sh
```

---

## 📅 Vytvoření a editace crontabu

Na Arch Linuxu (a většině systémů) upravíš crontab takto:

```bash
crontab -e
```

Tím se otevře crontab v editoru (např. `nano` nebo `vim`).

---

## 📥 Export a verzování crontabu

Pro správu `crontab` v Git repozitáři:

### 1. Uložit aktuální `crontab` do souboru

```bash
crontab -l > scripts/crontab
```

### 2. Nahrát zpět do systému

```bash
crontab scripts/crontab
```

### 3. Doporučená struktura v repozitáři

```
repo-root/
├── scripts/
│   └── crontab
```

---

## 🧪 Tipy pro testování

- Skripty musí být **spustitelné**:
  ```bash
  chmod +x script.sh
  ```

- Používej **absolutní cesty** (např. `/home/user/scripts/muj.sh`)

- Pro logování výstupu do souboru:
  ```cron
  0 6 * * * /home/user/scripts/backup.sh >> /var/log/backup.log 2>&1
  ```

---

## 📚 Užitečné odkazy

- [crontab.guru](https://crontab.guru) – snadná vizualizace a kontrola výrazů

---

