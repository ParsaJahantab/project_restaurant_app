class Comment{
  String author;
  String comment;
  String answer;
  double score;
  Comment(String author,String comment,double score)
  {
    this.author=author;
    this.comment=comment;
    this.score=score;
    this.answer="";
  }
  void setAnswer(String answer){
    this.answer=answer;
  }
  String getAuthor()
  {
    return author;
  }
  double getScore()
  {
    return score;
  }
  String getComment()
  {
    return comment;
  }
}
class Comment_list{
  List<Comment> Comm_list=List.empty(growable: true);
  Comment_list()
  {
  }
  void Comm_add(String author,String comment1,double score)
  {
    Comment comment=new Comment(author,comment1,score);
    Comm_list.add(comment);
  }
  List<Comment> getComments()
  {
    return Comm_list;
  }

}