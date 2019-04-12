class Timer2{
  int startTime;
  int timerLength;
  //timerLength should be in seconds
  Timer2(int timerLength){
    this.startTime = millis();
    this.timerLength = startTime + timerLength*1000;
  }
  int curTime(){
    return millis();
  }
  //returns how much time is left in seconds
  int timeLeft(){
    return (this.timerLength - this.curTime()) / 1000;
  }
}
