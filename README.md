# 🐧 Linux Server Administration & Automation on AWS EC2

<p align="center">
  <img src="https://img.shields.io/badge/OS-Amazon%20Linux%202023-orange?style=for-the-badge&logo=linux&logoColor=white" alt="Amazon Linux 2023">
  <img src="https://img.shields.io/badge/Cloud-AWS%20EC2-yellow?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS EC2">
  <img src="https://img.shields.io/badge/Shell-Bash-green?style=for-the-badge&logo=gnubash&logoColor=white" alt="Bash">
  <img src="https://img.shields.io/badge/Automation-Cron-blue?style=for-the-badge" alt="Cron Automation">
</p>

## 📌 Project Overview

A hands-on Linux administration and automation capstone project built on **Amazon Linux 2023 using AWS EC2**.

This project demonstrates practical Linux system administration skills, including multi-user management, role-based access control, file permissions, text processing, process management, Bash scripting, and automated system health monitoring.

The project also implements a scheduled daily system health report using Linux cron jobs.

| Project Detail | Information |
|---|---|
| **Project Name** | Linux Server Administration & Automation |
| **Author** | Neeraj Kumar |
| **Operating System** | Amazon Linux 2023 |
| **Cloud Platform** | AWS EC2 |
| **Instance Type** | t2.micro |
| **Shell** | Bash |
| **Automation** | Cron Jobs |
| **Documentation** | `Projrct_Docs/Project-Report.docx` |

---

## 🎯 Project Objectives

The main objective of this project is to gain hands-on experience in Linux server administration and automation by:

- Understanding the Linux file system hierarchy.
- Creating and managing multiple Linux users and groups.
- Implementing role-based access control.
- Managing file ownership and permissions.
- Configuring Access Control Lists (ACLs).
- Performing file operations and text processing.
- Monitoring Linux processes and system resources.
- Managing system services using `systemctl`.
- Automating daily system health reports using Bash and cron.
- Provisioning and securing a Linux server on AWS EC2.

---

## 🏗️ Project Architecture

The project uses a multi-user Linux server architecture with separate development, management, and shared directories.

```text
Linux Server (AWS EC2)
│
├── Users & Groups
│   ├── alice       → developers
│   ├── bob         → developers
│   └── charlie     → managers
│
├── Project Directories
│   ├── /project/dev/
│   ├── /project/manager/
│   └── /project/shared/
│
├── Access Control
│   ├── developers → Read/Write access to dev
│   ├── managers   → Read/Write access to manager
│   ├── everyone   → Read/Write access to shared
│   └── charlie    → Read-only ACL on dev
│
└── Automation
    └── Cron Job
        └── Daily System Health Report at 06:00
```

### 👥 User Access Management

| User | Group | Access |
|---|---|---|
| alice | developers | Read/Write: `/project/dev/` |
| bob | developers | Read/Write: `/project/dev/` |
| charlie | managers | Read/Write: `/project/manager/` |
| charlie | managers | Read-only ACL: `/project/dev/` |
| All users | Everyone | Shared directory access |

---

## 🛠️ Technologies & Skills Demonstrated

| Category | Commands / Tools |
|---|---|
| File System Navigation | `pwd`, `ls`, `cd`, `find`, `tree` |
| System Information | `uname`, `free`, `df`, `lsblk`, `hostnamectl` |
| User Management | `useradd`, `usermod`, `passwd`, `id` |
| Group Management | `groupadd`, `groups`, `gpasswd` |
| Password Policies | `chage` |
| Permissions & Ownership | `chmod`, `chown`, `chgrp` |
| Access Control Lists | `setfacl`, `getfacl` |
| Text Processing | `grep`, `awk`, `sed`, `sort`, `uniq`, `wc` |
| File Operations | `cp`, `mv`, `rm`, `touch` |
| Compression & Archiving | `gzip`, `tar` |
| Process Management | `ps`, `top`, `pgrep`, `kill` |
| Service Management | `systemctl` |
| Shell Scripting | Bash |
| Job Scheduling | `crontab` |
| Cloud Infrastructure | AWS EC2, Security Groups |

---

## 🚀 Project Implementation

### Phase 1: System Information & File System

- Collected Linux system and hardware information.
- Checked memory and disk utilization.
- Inspected available block devices.
- Explored the Linux directory hierarchy.
- Practiced navigation through directories such as `/etc`, `/var`, `/usr`, `/opt`, and `/home`.

**Commands practiced:**

```bash
uname -a
free -h
df -h
lsblk
pwd
ls -la
```

**Screenshot:**
Please refer the attached document file for this.

---

### Phase 2: User, Group & Permission Management

Created two Linux groups and three users to implement role-based access control.

**Groups created:**
- `developers`
- `managers`

**Users created:**
- `alice`
- `bob`
- `charlie`

**Tasks performed:**

- Created users and groups.
- Assigned users to their respective groups.
- Created project directories.
- Configured directory ownership and permissions.
- Implemented ACL-based read-only access.
- Configured password aging policies.

**Password policy configuration:**

| Policy | Value |
|---|---|
| Maximum password age | 90 days |
| Minimum password age | 7 days |
| Password expiry warning | 14 days |

**Permission Testing Results:**

| Test Scenario | Expected Result | Status |
|---|---|---|
| alice writes to `/project/dev/` | Allowed | ✅ Passed |
| alice writes to `/project/manager/` | Denied | ✅ Passed |
| charlie writes to `/project/dev/` | Denied | ✅ Passed |
| charlie lists `/project/dev/` after ACL | Allowed | ✅ Passed |
| Users write to `/project/shared/` | Allowed | ✅ Passed |

**Permission Testing Screenshot:** Please refer the attached document file for this.

**ACL Configuration Screenshot:** Please refer the attached document file for this.

---

### Phase 3: File Operations & Text Processing

Practiced Linux file handling and text processing using sample employee records and server log files.

**Tasks performed:**

- Searched specific patterns in log files.
- Extracted selected columns using `awk`.
- Modified text using `sed`.
- Sorted records and removed duplicates.
- Counted lines, words, and characters.
- Combined commands using pipes and filters.
- Created compressed backups using `gzip`.
- Archived and restored files using `tar`.

**Commands practiced:**

```bash
grep "ERROR" server.log

awk '{print $1, $2}' employee.txt

sed 's/old/new/g' employee.txt

sort employee.txt | uniq

wc -l employee.txt

tar -czvf backup.tar.gz project/

gzip server.log
```

**Screenshot:** Please refer the attached document file for this.

### Phase 4: Process Management & Automation

Configured and managed the Apache web server using `systemctl`.

**Tasks performed:**

- Installed the Apache HTTP server.
- Started and enabled the Apache service.
- Checked running processes.
- Monitored CPU and memory utilization.
- Created a Bash script for automated system reporting.
- Scheduled the report to execute every day at 06:00 AM.

**Service Management Commands:**

```bash
sudo yum install httpd -y

sudo systemctl start httpd

sudo systemctl enable httpd

sudo systemctl status httpd
```

#### 📊 Automated Daily System Health Report

Created a Bash script named `daily_report.sh` to collect important server information.

The report includes:

- Current date and time.
- Operating system and kernel information.
- Disk utilization.
- Memory utilization.
- Top CPU-consuming processes.
- Currently logged-in users.
- Recent system logs.

**Cron Job Configuration:**

```cron
0 6 * * * /usr/local/bin/daily_report.sh
```

This schedules the script to execute automatically every day at 06:00 AM (server local time).

**Cron Configuration Screenshot:** Please refer the attached document file for this.

---

## 📁 Repository Structure

```text
Linux-Server-Administration-Automation-on-AWS-EC2/
│
├── README.md
│
├── docs/
│   └── Project-Report.docx
│
├── scripts/
│   ├── setup_users_permissions.sh
│   └── daily_report.sh
│
└── screenshots/
    ├── step01-system-info-1.png
    ├── step06-permission-testing-1.png
    ├── step07-acl-1.png
    ├── step10-text-processing-1.png
    └── step13-cron-daily-report-4.png
```

---

## ⚙️ How to Reproduce This Project

Follow these steps to recreate the project on an AWS EC2 instance.

### Step 1: Launch an AWS EC2 Instance

Configure the instance with the following settings:

| Configuration | Value |
|---|---|
| AMI | Amazon Linux 2023 |
| Instance Type | t2.micro |
| Storage | Default |
| Security Group | Custom |
| SSH Port | 22 |
| SSH Source | My IP only |

### Step 2: Connect to the EC2 Instance

```bash
ssh -i "your-key.pem" ec2-user@<public-ip>
```

### Step 3: Clone the Repository

Replace the placeholders with your GitHub username and repository name.

```bash
git clone https://github.com/<your-username>/<repo-name>.git

cd <repo-name>
```

### Step 4: Configure Users, Groups & Permissions

```bash
cd scripts

sudo bash setup_users_permissions.sh
```

### Step 5: Configure the Daily Report Script

```bash
sudo cp daily_report.sh /usr/local/bin/

sudo chmod +x /usr/local/bin/daily_report.sh
```

### Step 6: Execute the Script Manually

```bash
sudo /usr/local/bin/daily_report.sh
```

### Step 7: Configure the Cron Job

```bash
(sudo crontab -l 2>/dev/null; echo "0 6 * * * /usr/local/bin/daily_report.sh") | sudo crontab -
```

Verify the scheduled job:

```bash
sudo crontab -l
```

**Note:** The same project can be practiced on a local VirtualBox Linux VM running CentOS or Ubuntu. On Ubuntu, use `apt` instead of `yum` and `apache2` instead of `httpd`.

---

## 🔐 Security Considerations

- Passwords are randomly generated by the setup script and are not hard-coded.
- AWS EC2 Security Group restricts SSH access to the administrator's IP address.
- User access is managed through Linux groups and directory permissions.
- POSIX ACLs provide additional access restrictions.
- No private SSH keys, passwords, or AWS credentials are stored in this repository.

**Important:** The `chmod 777` permission on `/project/shared/` is intentional for this learning exercise. It allows all users to read, write, and access the directory.

For production environments, a dedicated shared group with the setgid bit and appropriate sticky-bit configuration is a safer approach.

---

## 🔮 Future Improvements

The project can be extended with additional Linux administration and cloud automation capabilities.

- [ ] Email daily health reports using AWS SES.
- [ ] Implement log rotation using `logrotate`.
- [ ] Automate infrastructure provisioning using Terraform.
- [ ] Configure server management using Ansible.
- [ ] Integrate AWS CloudWatch for monitoring and alerts.
- [ ] Implement automated backup and recovery.
- [ ] Configure additional security hardening and auditing.

---

## 📚 Project Documentation

The complete project documentation, including implementation details and practical screenshots, is available in:

`Project_Docs/Project-Report.docx`

---

## 👨‍💻 Author

**Neeraj Kumar**

Linux Server Administration | AWS | Bash Scripting | Cloud & Automation

- LinkedIn: [Add Your LinkedIn Profile](https://www.linkedin.com/)
- GitHub: [Add Your GitHub Profile](https://github.com/)

---

<p align="center">
  ⭐ If you find this project useful, consider giving it a star!
</p>

<p align="center">
  <b>Built with Linux, Bash and AWS EC2 🐧</b>
</p>
