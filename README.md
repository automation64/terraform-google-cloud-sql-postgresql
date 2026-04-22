# terraform-google-cloud-sql-postgresql

![License](https://img.shields.io/github/license/automation64/terraform-google-cloud-sql-postgresql)
![GitHub stars](https://img.shields.io/github/stars/automation64/terraform-google-cloud-sql-postgresql?style=social)
![GitHub forks](https://img.shields.io/github/forks/automation64/terraform-google-cloud-sql-postgresql?style=social)

---

- [terraform-google-cloud-sql-postgresql](#terraform-google-cloud-sql-postgresql)
  - [📌 Overview](#-overview)
  - [🛠 Contributing](#-contributing)
  - [⚠️ Disclaimer](#️-disclaimer)
  - [📜 License](#-license)
  - [👤 Author](#-author)

---

## 📌 Overview

Terraform module for Google Cloud SQL PostgreSQL:

- Scope: single zonal cluster
- Features:
  - Final backup on database deletion
  - Use Google Secret Manager for root password
  - Disk autoresize enabled
  - Data API access disabled
  - Automatic backup enabled
  - No failover replica
  - No read pool
  - DBA database user for break-glass
  - Enforced SSL connection

---

## 🛠 Contributing

Contributions are welcome! Help us improve by submitting issues, feature requests, or pull requests.

- [Code of Conduct](https://github.com/automation64/terraform-google-cloud-sql-postgresql/blob/main/CODE_OF_CONDUCT.md)

---

## ⚠️ Disclaimer

This repository is provided "as is" without any warranties. The author is not responsible for any damages or issues arising from its use. Additionally, this project is not affiliated with or endorsed by any organization or entity. Use at your own risk.

---

## 📜 License

**terraform-google-cloud-sql-postgresql** is licensed under the [Apache-2.0 License](https://www.apache.org/licenses/LICENSE-2.0.txt).

---

## 👤 Author

- [SerDigital64](https://github.com/serdigital64)

---

🌟 **If you find this project useful, consider giving it a star!** ⭐
