# WordPress Admin Panel Automation Testing

โปรเจกต์ทดสอบระบบอัตโนมัติ (Automated Testing) สำหรับหน้าการจัดการหลังบ้านของ WordPress โดยพัฒนาสคริปต์การทดสอบด้วย Robot Framework ร่วมกับ SeleniumLibrary บนเบราว์เซอร์ Microsoft Edge

## 🛠️ เทคโนโลยีและเครื่องมือที่ใช้
- **Language/Framework:** Robot Framework (Python)
- **Library:** SeleniumLibrary
- **Browser:** Microsoft Edge (EdgeDriver)
- **Version Control:** Git & GitHub

## 🧪 เคสการทดสอบ (Test Cases)
สคริปต์นี้ครอบคลุมการทดสอบหลัก 3 สถานการณ์ (Scenarios) ดังนี้:
1. **Scenario 1: WordPress Login Fail With Wrong Password** - ทดสอบการล็อกอินไม่สำเร็จเมื่อใส่รหัสผ่านผิด และตรวจสอบข้อความแจ้งเตือน Error
2. **Scenario 2: WordPress Login Fail With Wrong user and Password** - ทดสอบการล็อกอินไม่สำเร็จเมื่อใส่ Username และ Password ผิด
3. **Scenario 3: WordPress Login Success and Navigate Menus** - ทดสอบการล็อกอินเข้าสู่ระบบสำเร็จ และจำลองพฤติกรรมการคลิกตรวจสอบหน้าเมนูหลักต่าง ๆ ในแดชบอร์ด ได้แก่:
   - หน้าแผงควบคุม (Dashboard)
   - หน้า Flatsome Panel
   - หน้าเรื่อง (Posts)
   - หน้า Portfolio
   - หน้าสื่อ (Media)

## 🚀 วิธีการสั่งรันโปรเจกต์
เปิด Terminal และพิมพ์คำสั่งรันผ่านโมดูล Python:
```bash
python -m robot test.robot
