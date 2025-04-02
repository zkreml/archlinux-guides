# Automatické připojení LUKS šifrovaného disku po startu 

Tento návod popisuje, jak zajistit automatické odemčení
a připojení LUKS šifrovaného disku při startu systému.

## 1. Zjištění UUID šifrovaného oddílu

```bash
lsblk -o NAME,SIZE,UUID
```

Zkopírujte UUID oddílu, který chcete připojovat (např. /dev/sdb2).

## 2. Vytvoření klíčového souboru

```bash
sudo dd if=/dev/urandom of=/root/luks-key bs=512 count=4
sudo chmod 600 /root/luks-key
```

## 3. Přidání klíče do LUKS disku

```bash
sudo cryptsetup luksAddKey /dev/sdX /root/luks-key
```
Nahraďte /dev/sdX konkrétním zařízením (např. /dev/sdb2).

> ⚠️ Při tomto kroku budete vyzváni k zadání **původního hesla** disku.  
> Tím ověříte, že máte oprávnění přidat nový klíč.


## 4. Úprava /etc/crypttab

```
sudo nano /etc/crypttab
```

Přidejte řádek:

```bash
mydata UUID=ca6f21db-2122-434f-b754-873bb3f6ac82 /root/luks-key luks
```

Nahraďte UUID tím, které jste zjistili výše.

## 5. Úprava /etc/fstab

```bash
sudo nano /etc/fstab 
```

Přidejte řádek:

```bash 
/dev/mapper/mydata /mnt/mydata ext4 defaults,nofail 0 2
```

## 6. Vytvoření přípojného bodu

```bash
sudo mkdir -p /mnt/mydata
```

## 7. Ověření funkčnosti

Zavřete disk, znovu načtěte systemd a připojte:

```bash
sudo umount /mnt/mydata
sudo cryptsetup close mydata
sudo systemctl daemon-reexec
sudo systemctl restart systemd-cryptsetup@mydata.service
sudo mount -a
```

## 8. Hotovo 

Po restartu se disk automaticky odemkne pomocí klíčového souboru a připojí do /mnt/mydata, bez nutnosti zadávat heslo.
