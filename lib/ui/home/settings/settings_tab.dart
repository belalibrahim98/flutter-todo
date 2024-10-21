import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String? selectedLanguage = 'English';
  String? selectedMode = 'Light';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      selectedLanguage = AppLocalizations.of(context)!.english;
      selectedMode = AppLocalizations.of(context)!.light;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 17.h),
          Container(
            width: 319.w,
            height: 48.h,
            padding: EdgeInsets.all(14.r),
            margin: EdgeInsets.symmetric(horizontal: 18.r),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1.5.w,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedLanguage ?? ''),
                DropdownButton(
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    padding: const EdgeInsets.all(0),
                    items: [
                      AppLocalizations.of(context)!.english,
                      AppLocalizations.of(context)!.arabic,
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newLang) {
                      if (newLang != null) {
                        setState(() {
                          selectedLanguage = newLang;
                        });
                      }
                    })
              ],
            ),
          ),
          SizedBox(height: 17.h),
          Text(AppLocalizations.of(context)!.mode,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 17.h),
          Container(
            width: 319.w,
            height: 48.h,
            padding: EdgeInsets.all(14.r),
            margin: EdgeInsets.symmetric(horizontal: 18.r),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1.5.w,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedMode ?? ''),
                DropdownButton(
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    padding: const EdgeInsets.all(0),
                    items: [
                      AppLocalizations.of(context)!.light,
                      AppLocalizations.of(context)!.dark,
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newMode) {
                      if (newMode != null) {
                        setState(() {
                          selectedMode = newMode;
                        });
                      }
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
