# Rclone S3 (Windows)

Le script a pour objectif de monter simplement en ligne de commande un lecteur S3 mappé sur un lecteur explorateur windows

Compatible **S3 privé ** 

---

## 🧰 Prérequis

### Windows
- Windows 10 / 11
- PowerShell (déjà inclus dans Windows)
- rclone installé et présent dans le PATH
- WinFsp installé

### Téléchargements
- rclone : https://rclone.org/downloads/
- WinFsp : https://winfsp.dev

⚠️ Sans WinFsp, le montage ne fonctionnera pas.

---

## 🔐 Sécurité

- Les clés S3 **ne sont jamais stockées**
- Access Key et Secret Key sont demandées en interactif
- Les credentials vivent uniquement en mémoire (variables d’environnement)

---

## ⚙️ Configuration rclone requise

Un remote rclone déjà configuré avec :

```ini
[Nom_Config]
type = s3
provider = Other
env_auth = true
endpoint = https://votre-endpoint-s3
region = us-east-1
acl = private
```

Un exemple est fourni via sample_rclone.conf
