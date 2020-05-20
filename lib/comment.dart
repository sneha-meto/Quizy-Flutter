class Comment {
  List comments = [
    "Wow! That's Impressive!",
    "Well done! Nice score.",
    "Hmm, not bad.",
    "You can do better than this!",
    "Better luck next time!",
    "Ouch! Give it another shot.",
  ];

  String getComment(int score, int total) {
    double percent = (score / total) * 100;
    if (percent == 100) {
      return comments[0];
    } else if (percent >= 80) {
      return comments[1];
    } else if (percent >= 60) {
      return comments[2];
    } else if (percent >= 40) {
      return comments[3];
    } else if (percent >= 20) {
      return comments[4];
    } else {
      return comments[5];
    }
  }
}
