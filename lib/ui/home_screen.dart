import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/DI/service_locator.dart';
import 'package:spotify_clone/bloc/album/album_bloc.dart';
import 'package:spotify_clone/bloc/album/album_event.dart';
import 'package:spotify_clone/bloc/playlist/playlist_bloc.dart';
import 'package:spotify_clone/bloc/playlist/playlist_event.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/data/datasource/artist_datasource.dart';
import 'package:spotify_clone/data/model/artist.dart';
import 'package:spotify_clone/ui/albumview_screen.dart';
import 'package:spotify_clone/ui/playlist_search_screen.dart';
import 'package:spotify_clone/ui/premium-purchase-screen.dart';
import 'package:spotify_clone/ui/setting_screen.dart';
import 'package:spotify_clone/widgets/bottom_player.dart';
//import 'package:tapsell_plus/tapsell_plus.dart';

class HomeScreen extends StatelessWidget {
  final String userType; // Add userType as a parameter

  const HomeScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      drawer: Drawer(
        child: SettingScreen(),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomScrollView(
                slivers: [
                  _Header(userType: userType),
                  _MostPopArtists(),
                  _JumpBackin(),
                  _TopMixes(),
                  _RecentPlays(),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 64),
              child: BottomPlayer(),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentPlays extends StatelessWidget {
  const _RecentPlays();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recently played",
              style: TextStyle(
                fontFamily: "AM",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: MyColors.whiteColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = PlaylistBloc(locator.get());
                              bloc.add(PlaylistFetchEvent("Upbeat"));
                              return bloc;
                            },
                            child: const PlaylistSearchScreen(
                              cover: "Upbeat-Mix.jpg",
                            ),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 133,
                          width: 133,
                          child: Image.asset("images/home/Upbeat-Mix.jpg"),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "Upbeat Mix",
                          style: TextStyle(
                            fontFamily: "AB",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 133,
                        width: 133,
                        child: Image.asset("images/home/Daily-Mix-1.jpg"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Daily Mix 1",
                        style: TextStyle(
                          fontFamily: "AB",
                          fontSize: 12,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = AlbumBloc(locator.get());
                              bloc.add(
                                AlbumListEvent("Travis Scott"),
                              );
                              return bloc;
                            },
                            child: const AlbumViewScreen(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 133,
                          width: 133,
                          child: Image.asset("images/home/UTOPIA.jpg"),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "UTOPIA",
                          style: TextStyle(
                            fontFamily: "AB",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = AlbumBloc(locator.get());
                              bloc.add(AlbumListEvent("21 Savage"));
                              return bloc;
                            },
                            child: const AlbumViewScreen(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 133,
                          width: 133,
                          child: Image.asset("images/home/american-dream.jpg"),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "american dream",
                          style: TextStyle(
                            fontFamily: "AB",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage("images/artists/JID.jpg"),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Text(
                          "JID",
                          style: TextStyle(
                            fontFamily: "AB",
                            fontSize: 12,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MostPopArtists extends StatelessWidget {
  const _MostPopArtists();

  @override
  Widget build(BuildContext context) {
    // Create an instance of the local datasource
    final ArtistDatasource artistDatasource = ArtistLocalDatasource();

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Popular Artists",
              style: TextStyle(
                fontFamily: "AM",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: MyColors.whiteColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<List<Artist>>(
              future: artistDatasource.getArtistList(), // Fetch artist data
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No artists found.'));
                }

                final artists = snapshot.data!;

                return SizedBox(
                  height: 199,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: artists.length,
                    itemBuilder: (context, index) {
                      final artist = artists[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16), // Add gap between items
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) {
                                    var bloc = AlbumBloc(locator.get());
                                    bloc.add(AlbumListEvent(artist.artistName ?? "Unknown Artist"));
                                    return bloc;
                                  },
                                  child: const AlbumViewScreen(),
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: SizedBox(
                                  height: 133,
                                  width: 133,
                                  child: Image.asset(
                                    "images/artists/${artist.artistImage ?? 'default_image.png'}",
                                    fit: BoxFit.cover, // Ensure the image covers the circular area
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                artist.artistName ?? "Unknown Artist",
                                style: const TextStyle(
                                  fontFamily: "AB",
                                  fontSize: 12,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _JumpBackin extends StatelessWidget {
  const _JumpBackin();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Jump back in",
              style: TextStyle(
                fontFamily: "AB",
                color: MyColors.whiteColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const _MixChip(
                    subtitle: "Future, Jack Harllow, Drake and more",
                    image: "Rap-Workout.jpg",
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = PlaylistBloc(locator.get());
                              bloc.add(PlaylistFetchEvent('Drake mix'));
                              return bloc;
                            },
                            child: const PlaylistSearchScreen(
                              cover: "Drake-Mix.jpg",
                            ),
                          ),
                        ),
                      );
                    },
                    child: const _MixChip(
                      subtitle: "JID, Baby Keem and 21 Savage",
                      image: 'Daily-Mix-1.jpg',
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundImage:
                            AssetImage("images/artists/Kendrick-Lamar.jpg"),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Kendrick Lamar",
                        style: TextStyle(
                          fontFamily: "AB",
                          fontSize: 12,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = AlbumBloc(locator.get());
                              bloc.add(AlbumListEvent("Travis Scott"));
                              return bloc;
                            },
                            child: const AlbumViewScreen(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 153,
                          width: 153,
                          child: Image.asset("images/home/UTOPIA.jpg"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "UTOPIA",
                              style: TextStyle(
                                fontFamily: "AB",
                                fontSize: 12,
                                color: MyColors.whiteColor,
                              ),
                            ),
                            Text(
                              "Album . Travis Scott",
                              style: TextStyle(
                                fontFamily: "AM",
                                fontSize: 12.5,
                                color: MyColors.lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = AlbumBloc(locator.get());
                              bloc.add(AlbumListEvent("Drake"));
                              return bloc;
                            },
                            child: const AlbumViewScreen(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 153,
                          width: 153,
                          child:
                              Image.asset("images/home/For-All-The-Dogs.jpg"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "For All The Dogs",
                              style: TextStyle(
                                fontFamily: "AB",
                                fontSize: 12,
                                color: MyColors.whiteColor,
                              ),
                            ),
                            Text(
                              "Album . Drake",
                              style: TextStyle(
                                fontFamily: "AM",
                                fontSize: 12.5,
                                color: MyColors.lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopMixes extends StatelessWidget {
  const _TopMixes();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your top mixes",
              style: TextStyle(
                fontFamily: "AB",
                color: MyColors.whiteColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = PlaylistBloc(locator.get());
                              bloc.add(PlaylistFetchEvent('2010'));
                              return bloc;
                            },
                            child: const PlaylistSearchScreen(
                              cover: "2010s-mix.png",
                            ),
                          ),
                        ),
                      );
                    },
                    child: const _MixChip(
                      subtitle: "Travis Scott, Soul Chef, Kanye West and more",
                      image: "2010s-mix.png",
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = PlaylistBloc(locator.get());
                              bloc.add(PlaylistFetchEvent("Chill"));
                              return bloc;
                            },
                            child: const PlaylistSearchScreen(
                                cover: "chill-mix.png"),
                          ),
                        ),
                      );
                    },
                    child: const _MixChip(
                      subtitle: "Talyor Swift, The Beatles and more",
                      image: 'chill-mix.png',
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = PlaylistBloc(locator.get());
                              bloc.add(PlaylistFetchEvent("Upbeat"));
                              return bloc;
                            },
                            child: const PlaylistSearchScreen(
                              cover: "Upbeat-Mix.jpg",
                            ),
                          ),
                        ),
                      );
                    },
                    child: const _MixChip(
                      subtitle: "benny blanco, Darke and more",
                      image: 'Upbeat-Mix.jpg',
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const _MixChip(
                    subtitle: "Baby keem, Travis Scott and Drake",
                    image: "Offset-Mix.jpg",
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = PlaylistBloc(locator.get());
                              bloc.add(PlaylistFetchEvent('Drake mix'));
                              return bloc;
                            },
                            child: const PlaylistSearchScreen(
                              cover: "Drake-Mix.jpg",
                            ),
                          ),
                        ),
                      );
                    },
                    child: const _MixChip(
                      subtitle: "JID, Baby Keem and 21 Savage",
                      image: 'Drake-Mix.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String userType; // Add userType as a parameter

  const _Header({required this.userType});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          // Conditionally render the ad banner for free users only
          if (userType == 'free')
            GestureDetector(
              onTap: () {
                // Simulate ad click behavior
                print('Fake Banner Ad Clicked');
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/fake_banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          // Rest of your header content
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("images/myImage.png"),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Good evening",
                          style: TextStyle(
                            fontFamily: "AB",
                            color: MyColors.whiteColor,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/icon_bell.png'),
                          Image.asset("images/icon_recent.png"),
                          GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Image.asset("images/icon_settings.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        color: MyColors.darGreyColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(145),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Music",
                            style: TextStyle(
                              fontFamily: "AM",
                              fontSize: 14,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        color: MyColors.darGreyColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(145),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Podcasts",
                            style: TextStyle(
                              fontFamily: "AM",
                              fontSize: 14,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Rectangular Banner between Music/Podcasts and Liked Songs/JID sections
                Padding(
                  padding: const EdgeInsets.only(bottom: 20), // Padding from bottom
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Premium Purchase Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PremiumPurchaseScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 80, // Adjust height as needed
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                        gradient: const LinearGradient(
                          colors: [Colors.pink, Colors.purple], // Pink to purple gradient
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Go Premium',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Unlock all features',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Liked Songs, JID, and other content
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 55,
                          width: (MediaQuery.of(context).size.width / 1.77) - 45,
                          decoration: const BoxDecoration(
                            color: MyColors.darGreyColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Row(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "images/liked_songs.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    'images/icon_heart_white.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Liked Songs",
                                style: TextStyle(
                                  fontFamily: "AB",
                                  fontSize: 12,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        _RecentPlaysChip(
                          image: "artists/JID.jpg",
                          title: "JID",
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) {
                                    var bloc = AlbumBloc(locator.get());
                                    bloc.add(AlbumListEvent("21 Savage"));
                                    return bloc;
                                  },
                                  child: const AlbumViewScreen(),
                                ),
                              ),
                            );
                          },
                          child: _RecentPlaysChip(
                            image: "home/american-dream.jpg",
                            title: "american dream",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) {
                                    var bloc = AlbumBloc(locator.get());
                                    bloc.add(AlbumListEvent("Travis Scott"));
                                    return bloc;
                                  },
                                  child: const AlbumViewScreen(),
                                ),
                              ),
                            );
                          },
                          child: _RecentPlaysChip(
                            image: "home/UTOPIA.jpg",
                            title: "UTOPIA",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) {
                                    var bloc = PlaylistBloc(locator.get());
                                    bloc.add(PlaylistFetchEvent("Upbeat"));
                                    return bloc;
                                  },
                                  child: const PlaylistSearchScreen(
                                    cover: "Upbeat-Mix.jpg",
                                  ),
                                ),
                              ),
                            );
                          },
                          child: _RecentPlaysChip(
                            image: "home/Upbeat-Mix.jpg",
                            title: "Upbeat Mix",
                          ),
                        ),
                        _RecentPlaysChip(
                          image: "home/Daily-Mix-1.jpg",
                          title: "Daily Mix",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentPlaysChip extends StatelessWidget {
  const _RecentPlaysChip({required this.image, required this.title});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: (MediaQuery.of(context).size.width / 1.77) - 45,
      decoration: const BoxDecoration(
        color: MyColors.darGreyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              image: DecorationImage(
                image: AssetImage(
                  "images/$image",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          AutoSizeText(
            title,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontFamily: "AB",
            ),
          )
        ],
      ),
    );
  }
}



class _MixChip extends StatelessWidget {
  const _MixChip({required this.subtitle, required this.image});
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 153,
          width: 153,
          child: Image.asset("images/home/$image"),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 150,
          child: Text(
            subtitle,
            style: const TextStyle(
              fontFamily: "AM",
              fontSize: 12.5,
              color: MyColors.lightGrey,
            ),
          ),
        ),
      ],
    );
  }
}
