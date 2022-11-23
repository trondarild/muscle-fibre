/** Simulates a simple contracting unit with tetanus integration and relaxation
*/
class MuscleFibre {
  
  float minlength = 25.f; // length at max contraction 
  float maxlength = 50.f;
  float contraction = 0.f;
  float w = 20.f;
  float x = 0.f;
  float y = 0.f;
  float l = 0;
  // row, col, growth, decay, accumulate, decaythreshold, limit
  LimitedLeakyIntegrator integrator = new LimitedLeakyIntegrator(
   1,1, 
   0.8, 0.85, 
   0.9,  0.1, 1.f);

  float length() {
    return l;
  }

  void excite(float[] a){
    // integrate inputs
    float[][] exc = arrayToMatrix(a);
    integrator.setInput(exc);
    
  }
  void draw(){
    fill(200);
    //circle(width/2, height/2, 100);
    
    rect(x, y, l, w);
    fill(0);
    circle(x+l, w*0.5, w*0.4); // mark fibre end point
  }
  
  void tick(){
    integrator.tick();
    contraction = integrator.getOutput()[0][0];
    l = minlength + (maxlength-minlength)*(1-contraction);
  
  }
}
