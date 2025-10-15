import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // صورة المستخدم
  String _imagePath = "assets/images/profile.png";

  // بيانات المستخدم
  String _name = "John Doe";
  String _email = "johndoe@gmail.com";
  String _phone = "+1 234 567 890";

  // دالة لفتح نافذة منبثقة لتعديل البيانات
  void _showEditDialog({
    required String title,
    required String initialValue,
    required Function(String) onSave,
  }) {
    final controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text("Edit $title"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: "Enter new $title",
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDB3022),
              ),
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$title updated successfully ✅")),
                );
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // دالة لإنشاء صف عرض الحقل + زر التعديل
  Widget _buildProfileField({
    required String label,
    required String value,
    required IconData icon,
    required VoidCallback onEdit,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFDB3022)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$label:  $value",
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFFDB3022)),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }

  // 🧾 دالة تسجيل الخروج من Firebase
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Logged out successfully ✅")),
      );

      // الانتقال لصفحة تسجيل الدخول وإزالة جميع الصفحات السابقة من المكدس
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } catch (e) {
      print("Logout error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error logging out ❌")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        foregroundColor: const Color(0xFFDB3022),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            // 🧍‍♂️ صورة البروفايل مع زر الكاميرا
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(_imagePath),
                  backgroundColor: Colors.grey[200],
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFDB3022),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("ميزة تغيير الصورة لم تُفعل بعد 📸"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 🧾 حقول البيانات
            _buildProfileField(
              label: "Name",
              value: _name,
              icon: Icons.person,
              onEdit: () {
                _showEditDialog(
                  title: "Name",
                  initialValue: _name,
                  onSave: (newValue) => setState(() => _name = newValue),
                );
              },
            ),
            _buildProfileField(
              label: "Email",
              value: _email,
              icon: Icons.email,
              onEdit: () {
                _showEditDialog(
                  title: "Email",
                  initialValue: _email,
                  onSave: (newValue) => setState(() => _email = newValue),
                );
              },
            ),
            _buildProfileField(
              label: "Phone",
              value: _phone,
              icon: Icons.phone,
              onEdit: () {
                _showEditDialog(
                  title: "Phone",
                  initialValue: _phone,
                  onSave: (newValue) => setState(() => _phone = newValue),
                );
              },
            ),

            const SizedBox(height: 40),

            // 🚪 زر تسجيل الخروج
            ElevatedButton.icon(
              onPressed: _logout, // ✅ الآن يسجل خروج فعلي من Firebase
              icon: const Icon(Icons.logout),
              label: const Text(
                "Log Out",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDB3022),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
