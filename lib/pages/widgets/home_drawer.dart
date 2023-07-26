import 'package:flutter/material.dart';
import 'package:music_app/utils/asset_utils.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          HomeDrawerProfileView(),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text("Library"),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Folders"),
          ),
          ListTile(
            leading: Icon(Icons.equalizer),
            title: Text("Equalizer"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About"),
          ),
        ],
      ),
    );
  }
}

class HomeDrawerProfileView extends StatelessWidget {
  const HomeDrawerProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.transparent, Colors.black])
                  .createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              AssetUtils.getImage('james_arthur.jpg'),
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
            ),
          ),
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.transparent),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                AssetUtils.getImage('james_arthur_profile.jpg'),
              ),
            ),
            accountName: Text("Safe Inside"),
            accountEmail: Text("James Arthur"),
          )
        ],
      ),
    );
  }
}
