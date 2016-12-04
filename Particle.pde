// Particle definition
public class Particle
{
  public int id;
  public PVector position = new PVector(0,0);
  public float size = 3f;
  
  public Particle(int id, PVector position, float size){
     this.id = id;
     this.position = position;
     this.size = size;
  }
  
  public void Show()
  {
     ellipse(position.x,position.y,size,size);
  }
}