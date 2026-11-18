import 'package:final_project/widgets/coming_soon.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: const Text(
              'New & Hot',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 27,
                  width: 27,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: '  🍿 Coming Soon  ',
                ),
                Tab(
                  text: "  🔥 Everyone's watching  ",
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSsHIKxVXL8Kz1UtqfDmGddXap7WUR_vJOklQb_SzllN9MB1Y8wBw6NjhZH7qAmRE9ds9PH',
                    overview:
                        'Thunderbolts follows a group of unconventional superheroes who emerge in a world without the Avengers. As this new team bands together, they navigate complex missions and moral dilemmas, seeking to establish themselves as protectors while uncovering hidden threats that could jeopardize global safety and stability.',
                    logoUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/a/ae/Thunderbolts%2A_logo.jpg",
                    month: "May",
                    day: "2",
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/en/7/76/Wolf_Man_2025_poster.jpg',
                    overview:
                        'Blake and his family are attacked by an unseen animal and, in a desperate escape, barricade themselves inside a farmhouse as the creature prowls the perimeter. As the night stretches on, however, Blake begins to behave strangely.',
                    logoUrl:
                        "https://i0.wp.com/www.wearemoviegeeks.com/wp-content/uploads/wolf-man-1024x280.jpg?resize=620%2C170&ssl=1",
                    month: "Jan",
                    day: "17",
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/en/5/51/Back_in_Action_poster.jpg',
                    overview:
                        "Former CIA spies Emily and Matt are pulled back into espionage after their secret identities are exposed.",
                    logoUrl:
                        'data:image/png;base64,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',
                    month: "Apr",
                    day: "4",
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReZbSUI8h2NBHaJ6alIcqgtE8v5Z5XGftIyQ&s',
                    overview:
                        'The story follows Henry Danger, played by Jace Norman, as he meets a superfan who wants to join him in fighting crime. The superfan finds a device that opens alternate realities. Henry must work with his best friend Jasper (Sean Ryan Fox) and the superfan to avoid being trapped in another dimension.',
                    logoUrl:
                        'https://upload.wikimedia.org/wikipedia/en/8/87/Henry_Danger_The_Movie_logo.png',
                    month: "Nov",
                    day: "12",
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/en/e/e2/Flight_risk_2024.jpg',
                    overview:
                        'A U.S. marshal boards a small plane to transfer a government witness to New York. As they cross the Alaskan wilderness, tensions start to rise as not everyone on the flight is who they appear to be.',
                    logoUrl:
                        'https://dx35vtwkllhj9.cloudfront.net/lionsgate/flight-risk/images/regions/gb/tt.png',
                    month: "Jan",
                    day: "24",
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/en/d/d7/Star_Trek_Section_31_poster.jpg',
                    overview:
                        'The Federation calls on Adm. James T. Kirk (William Shatner) and the crew of the Starship Enterprise to contain an immense nimbused object that is on a crash course with Earth. After investigating, the crew discovers that the alien cloud harbors artificial intelligence with an ominous primary directive. Crisis strikes when a probe dispatched by the energy cloud attacks the crew, abducting navigator Lt. Ilia (Persis Khambatta). An android look-alike containing her memories shows up soon after.',
                    logoUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwKnE_LXLjNBGbakmvBPDderRE8jMTukDaTA&s',
                    month: "Jun",
                    day: "21",
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/en/3/35/Screamboat_%282025%29_poster.jpg',
                    overview:
                        'A late-night boat ride in New York City becomes a struggle for survival when a seemingly harmless mouse transforms into a dangerous monster. Passengers must fight to stay alive.',
                    logoUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiRNgFDI8F1Ara5L8qrjk0lRgrs5p9LHS8pQ&s',
                    month: "Oct",
                    day: "26",
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/en/6/67/Dog_Man_film_poster.jpg',
                    overview:
                        'As a child, Douglas was abused by a violent father who then threw him to the dogs. Instead of attacking him, the dogs protected him. Traumatised and leading a life on the margins of society with his dogs, Douglas descends into a murderous madness.',
                    logoUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQThYMfym_HnHiks9EDgePO0us0sSKi69ilwA&s',
                    month: "Feb",
                    day: "16",
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/en/4/47/Brave_the_Dark_%28film_poster%29.jpg',
                    overview:
                        'When Mr. Deen discovers one of his students has been living out of his car and thrown into jail, he decides to bail him out. Determined to curb Nate is self-destructive behavior, Mr. Deen discovers a host of secrets that are slowly tearing Nate apart.',
                    logoUrl:
                        'https://images.angelstudios.com/image/upload/f_auto/q_auto/v1726685649/angel-studios/projects/brave-the-dark/22c6d132-b244-496d-9bca-288bd6148737.png',
                    month: "Dec",
                    day: "20",
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8374f960-2731-4290-b279-3a2f080c69b9/di6jmth-88179a13-88a2-4948-a867-44d5b988d624.jpg/v1/fill/w_1280,h_1811,q_75,strp/m3gan_2_0_by_sierahideki_di6jmth-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTgxMSIsInBhdGgiOiJcL2ZcLzgzNzRmOTYwLTI3MzEtNDI5MC1iMjc5LTNhMmYwODBjNjliOVwvZGk2am10aC04ODE3OWExMy04OGEyLTQ5NDgtYTg2Ny00NGQ1Yjk4OGQ2MjQuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.qUtLg66D2Zlc-sXS_xrS_8cNjmbA3ny8bXuBdA_lKlE',
                    overview:
                        'M3GAN 2.0 is an upcoming American science fiction horror film directed by Gerard Johnstone and written by Akela Cooper. A sequel to M3GAN, it sees Allison Williams and Violet McGraw return to star, alongside Ivanna Sakhno, Timm Sharp, Aristotle Athari and Jemaine Clement.',
                    logoUrl:
                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4c8e68aa-0495-4c81-b0c8-64f7a380db27/dii3i78-c766d892-64c1-4f3c-b1a0-b31e2356ce8a.png/v1/fill/w_1280,h_768,q_80,strp/m3gan_2_0_official_logo_by_xandersentertainment_dii3i78-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzY4IiwicGF0aCI6IlwvZlwvNGM4ZTY4YWEtMDQ5NS00YzgxLWIwYzgtNjRmN2EzODBkYjI3XC9kaWkzaTc4LWM3NjZkODkyLTY0YzEtNGYzYy1iMWEwLWIzMWUyMzU2Y2U4YS5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.jkiWDKeb61KRxfXWtK11_FGXw4NiHtWwubTmNoQa1JU',
                    month: "Jun",
                    day: "27",
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
