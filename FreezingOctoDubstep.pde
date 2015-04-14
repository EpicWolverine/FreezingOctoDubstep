void setup(){ size(600,700); frameRate(60); background(255); }

float BallY=200;
float V=0.8;
float A=1.2;
int EndState=0;
float PosGraphX=50;
float VelGraphX=50;
float AccGraphX=50;

FloatList PosPoints = new FloatList();
FloatList VelPoints = new FloatList();
FloatList AccPoints = new FloatList();

void draw()
{ //BALL PHYSICS
  float time0=millis();
  time0=time0/1000;
  
  background(255);
  fill(255); ellipse(500,BallY,50,50);
  fill(128,0,128); ellipse(500,BallY,50,50);
  BallY=BallY+V; V+=A;
  if(BallY>=600){ BallY=600; V=V*.7; V=-V; /*println("BOUNCE")*/; 
                  if (abs(V)<5){ BallY=600; V=0; A=0; EndState=1; }}
  
  //println(BallY);
  //GRAPHS SETUP
  fill(0); stroke(0); strokeWeight(2);
  line(50,50,50,200); line(50,200,400,200); 
  line(50,250,50,400); line(50,325,400,325);
  line(50,450,50,600); line(50,525,400,525);
  //TIMING
  //float time1=millis()-time0;
  String s = "t = " + time0;
  if(EndState==1 && time0 >= 5){ 
    while(true);
  }
  else{
  }
 
  float POS=600-BallY;
  String POS1 = "X = " + POS;
  String V1 = "V = " + -V;
  String A1 = "A = " + -A;
  textSize(16); 
  text(V1,410,335);
  text(A1,410,535);
  text(POS1,410,135);
  text(s,50,675);
  
  //GRAPHING
  //position
  float PosGraphY = POS/3;
  fill(255,0,0); 
  strokeWeight(3); 
  stroke(255,0,0); 
  ellipse(PosGraphX,200-PosGraphY,5,5); 
  PosGraphX+=(1.5);
  
  PosPoints.append(POS/3);
  //println(PosPoints);
  if(PosPoints.size() != 1){
    for(int point = 1; point < PosPoints.size(); point++){
      line(50+(1.5*(point-1)), 200-PosPoints.get(point-1), 50+(1.5*(point)), 200-PosPoints.get(point));
    }
  }  
  //velocity
  float VelGraphY = -V;
  fill(255,0,0); 
  strokeWeight(3); 
  stroke(255,0,0); 
  ellipse(VelGraphX,325-VelGraphY,5,5); 
  VelGraphX+=(1.5);
  
  VelPoints.append(-V);
  //println(VelPoints);
  if(VelPoints.size() != 1){
    for(int point = 1; point < VelPoints.size(); point++){
      line(50+(1.5*(point-1)), 325-VelPoints.get(point-1), 50+(1.5*(point)), 325-VelPoints.get(point));
    }
  }
  //acceleration
  float AccGraphY = -A*5;
  fill(255,0,0); 
  strokeWeight(3); 
  stroke(255,0,0); 
  ellipse(AccGraphX,525-AccGraphY,5,5); 
  AccGraphX+=(1.5);
  
  AccPoints.append(-A*5);
  //println(VelPoints);
  if(AccPoints.size() != 1){
    for(int point = 1; point < AccPoints.size(); point++){
      line(50+(1.5*(point-1)), 525-AccPoints.get(point-1), 50+(1.5*(point)), 525-AccPoints.get(point));
    }
  }  
}
