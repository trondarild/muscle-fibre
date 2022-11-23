/** Simulates a simple contracting unit with tetanus integration and relaxation
*/
class MuscleFibre {
  
  float minlength = 25.f;
  float maxlength = 50.f;
  float contraction = 0.f;
  float w = 20.f;
  float x = 0.f;
  float y = 0.f;
  float l = 0;

  float length() {
    return l;
  }

  void excite(float[] a){}
  void draw(){
    fill(200);
    //circle(width/2, height/2, 100);
    
    rect(x, y, l, w);
  }
  
  void tick(){
    l = minlength + (maxlength-minlength)*(1-contraction);
  
  }
}
