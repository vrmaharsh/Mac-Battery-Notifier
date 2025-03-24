# 🔋 Mac Battery Notifier

A simple **Mac automation script** that sends Telegram notifications when your Mac is charging.  
This script runs **even when the lid is closed** and sends a special notification when the battery reaches **99%**. 🚀  

---

## 🚀 Features  
✅ Sends battery percentage updates **only when charging**  
✅ Special notification when the battery reaches **99%**  
✅ Works even when the **lid is closed**  
✅ Runs automatically every 5 minutes  

---

## 📌 Setup Guide  

### **1️⃣ Install Dependencies**  
Before running the script, install `curl`:  
```bash
brew install curl
```

---

### **2️⃣ Create a Telegram Bot**  
1. **Open Telegram** and search for **BotFather**.  
2. Start the bot and run:  
   ```
   /newbot
   ```
3. **Give it a name** (e.g., `MacBatteryBot`).  
4. Copy the **Bot Token** (you’ll need this later).  

📌 **Example Image:** *<img width="488" alt="image" src="https://github.com/user-attachments/assets/d32aaf0f-009e-4d7f-a910-744128cbb83a" />
*  

---

### **3️⃣ Get Your Telegram Chat ID**  
1. Open **Telegram Web/Desktop**.  
2. Send a message to your bot.  
3. Open this link in your browser (replace `YOUR_BOT_TOKEN`):  
   ```
   https://api.telegram.org/botYOUR_BOT_TOKEN/getUpdates
   ```
4. Find `"chat": {"id": YOUR_CHAT_ID}` → **Copy your `CHAT_ID`**.  

📌 **Example Image:** <img width="1143" alt="image" src="https://github.com/user-attachments/assets/b2c698b9-5b16-4037-9a61-ee6f4644d146" />


---

### **4️⃣ Configure the Script**  
1. Open the script:  
   ```bash
   nano battery_notifier.sh
   ```
2. Replace these lines with your actual **Bot Token** and **Chat ID**:  
   ```bash
   BOT_TOKEN="your_bot_token_here"
   CHAT_ID="your_chat_id_here"
   ```
3. Save & Exit (`Ctrl + X`, then `Y`, then `Enter`).  

---

### **5️⃣ Make the Script Executable**  
Run this to give **execution permission**:  
```bash
chmod +x battery_notifier.sh
```

---

### **6️⃣ Automate the Script (Run Every 5 Minutes)**  
1. Open crontab:  
   ```bash
   crontab -e
   ```
2. Add this line at the bottom:  
   ```bash
   */5 * * * * ~/Mac-Battery-Notifier/battery_notifier.sh
   ```
3. **Save & Exit** (`Ctrl + X`, then `Y`, then `Enter`).  

✅ **Now, your script will run automatically every 5 minutes!**  

---

### **7️⃣ Keep Mac Awake While Charging (Even with Lid Closed)**  
Run these commands to prevent Mac from sleeping:  
```bash
sudo pmset -c sleep 0
sudo pmset -c disablesleep 1
```
✅ This ensures your Mac **stays awake while charging** and keeps sending battery updates!  

---

### **8️⃣ How to Stop the Script?**  
To remove the automation:  
```bash
crontab -e
```
Delete the `battery_notifier.sh` entry and save.  

To re-enable sleep mode:  
```bash
sudo pmset -c sleep 1
sudo pmset -c disablesleep 0
```

---

## 🎯 Expected Output  
📩 **<img width="1131" alt="image" src="https://github.com/user-attachments/assets/37692ea4-33ad-4b84-9c54-f449995fdf3b" />
**  
```
🔋 Mac Battery: 45% (Charging)
```
At **99%**, you’ll get a special notification:  
```
✅ Mac Battery Fully Charged: 99%
```

📌 **Example Image:** *<img width="1136" alt="image" src="https://github.com/user-attachments/assets/e8e60cd1-2907-46a6-be4a-64af7e1042d5" />
*  

---

## 🎯 Future Improvements  
- 🔹 Add a web dashboard to track battery stats  
- 🔹 Notify when Mac is unplugged  

---

## 🤝 Contributing  
Feel free to submit **pull requests** if you can improve the script! 🚀  

---

## 📜 License  
MIT License - Use & modify freely.  

---
