class OnboardingContents {
  final String title;
  final String image;
  final String desc; // TODO: where is this field used? if not used, delete it

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title:
        "Track Your progress and get the result", // TODO: language fixes. capitalization. which result?
    image:
        "assets/image1.png", // TODO: the images look very common, but it is not a big problem
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
