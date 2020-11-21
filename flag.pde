void setup()
{
  fullScreen(P3D);
  colorMode(HSB);
}

float x;
float y;
float z;
float px;
float py;
float pz;
float xangle=-PI/8;
float yangle=PI/2;
int factor=2;
float t=0;
float dt=0.1;

void mousePressed()
{
  exit();
}

void keyPressed()
{
  if(keyCode==UP) xangle+=0.1;
  if(keyCode==DOWN) xangle-=0.1;
  if(keyCode==LEFT) yangle-=0.1;
  if(keyCode==RIGHT) yangle+=0.1;
}

float col=0;

void draw()
{
  strokeWeight(4);
  background(0);
  translate(width/2,height/2,0);
  rotateX(xangle);
  rotateY(yangle);
  stroke(0,255,255);
  for(z=0; z<3; z+=0.1)
  {
    for(x=-factor*PI; x<factor*PI; x+=0.01)
      {
        y=exp(-z)*cos(x);
        px=map(x,-factor*PI,factor*PI,-width/2,width/2);
        py=map(y,-factor,factor,-height/2,height/2);
        pz=map(z,0,3,0,1000);
        stroke(col,255,255);
        col=80*z/3+135;
        point(px,-py,-pz);
      }
  }
  t+=dt;
}
