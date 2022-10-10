class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Track Your progress and get the result",
    image: "assets/image1.png",
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardingContents(
    title: "Practice your coding skills",
    image: "assets/image2.png",
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Trace problems and find solutions",
    image: "assets/image3.png",
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
