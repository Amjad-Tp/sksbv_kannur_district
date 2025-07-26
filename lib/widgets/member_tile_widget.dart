import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';
import 'package:sksbv_kannur_jilla/models/registration_model.dart';

class MemberTile extends StatelessWidget {
  const MemberTile({
    super.key,
    required this.member,
    this.isAdmin = false,
    this.onDelete,
  });

  final MemberModel member;
  final bool isAdmin;
  final VoidCallback? onDelete;

  void _copyPhone(BuildContext context, String phone) {
    Clipboard.setData(ClipboardData(text: phone));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied $phone'),
        duration: const Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final phoneText = "+91 ${member.phone}";
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              member.name,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          cSizedBoxWidth10,
          Expanded(
            child: Text(
              member.position,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          cSizedBoxWidth10,
          if (screenWidth > 480)
            Tooltip(
              message: 'Tap to copy',
              child: GestureDetector(
                onTap: () => _copyPhone(context, phoneText),
                child: Text(
                  phoneText,
                  style: GoogleFonts.workSans(
                    fontWeight: fw600,
                    color: royalBlue,
                  ),
                ),
              ),
            ),
          if (isAdmin) ...[
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ],
      ),
    );
  }
}
