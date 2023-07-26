import 'package:flutter/material.dart';
import 'package:music_app/pages/widgets/home_drawer.dart';
import 'package:music_app/resources/app_colors.dart';
import 'package:music_app/utils/asset_utils.dart';

const kEdgeSpacing = 15.0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kEdgeSpacing),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kBlack200,
              expandedHeight: 80,
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: kBlack100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search you music",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white54),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCircularMenu(
                        icon: Icons.history,
                        color: Colors.blue,
                        title: "History"),
                    _buildCircularMenu(
                        icon: Icons.favorite_border_sharp,
                        color: Colors.pink,
                        title: "Favorites"),
                    _buildCircularMenu(
                        icon: Icons.graphic_eq,
                        color: Colors.green,
                        title: "Equalizer"),
                    _buildCircularMenu(
                        icon: Icons.shuffle,
                        color: Colors.yellow,
                        title: "Shuffle")
                  ],
                )
              ],
            )),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recently added songs",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 28,
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildRecentSongWidget(
                          title: "A Year Ago", subTitle: "James Arthur"),
                      _buildRecentSongWidget(
                          title: "That's not how this work",
                          subTitle: "Charlie Puth"),
                      _buildRecentSongWidget(
                          title: "Eyes Closed", subTitle: "Ed Sheran"),
                    ],
                  ),
                )
              ]),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recently played albums",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 28,
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildRecentAlbumWidget(
                        title: "Back from the Edge",
                        subTitle: "James Arthur",
                        image: AssetUtils.getImage('james_arthur.jpg'),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Artists",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 28,
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                            AssetUtils.getImage('james_arthur_profile.jpg')),
                      )
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularMenu(
      {required IconData icon, required Color color, required String title}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          radius: 30,
          child: Icon(
            icon,
            color: color,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }

  Widget _buildRecentSongWidget({
    required String title,
    required String subTitle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: kBlack300, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          Icon(
            Icons.music_note,
            size: 50,
          )
        ],
      ),
    );
  }

  Widget _buildRecentAlbumWidget({
    required String image,
    required String title,
    required String subTitle,
  }) {
    return SizedBox(
      width: 180,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image)),
          const SizedBox(height: 5),
          Column(
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
