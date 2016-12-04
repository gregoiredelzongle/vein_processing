// BRANCH DEFINITION
public class Branch
{
  public boolean isFinished = false;
  public ArrayList<Particle> parts;
  
  private float size;
  private PVector position;
  private PVector direction;
  
  private int randomSeed;
  
  public Branch(PVector position,PVector direction, float size){
    isFinished = false;
    this.position = position.copy();
    this.direction = direction.copy();
    this.size = size;
    this.direction = this.direction.mult(size);

    parts = new ArrayList<Particle>();
    randomSeed = int(random(0,100));
  }
  
  public void Iterate()
  { 
    if(isFinished)
      return;
      
    //ITERATE
    int id = parts.size();
    float angle = map(noise(id*noiseScale,randomSeed),0,1,-1,1)*noiseIntensity;
    direction = direction.rotate(radians(angle));
    
    position = PVector.add(position,direction);
    
    Particle p = new Particle(id,position,size);
    
    if(id != 0 && DoesCollide(p))
    {
      isFinished = true;
      return;
    }
    
    parts.add(p);
    collisionGrid.set(p.position,true);
    
    // Show particle
    p.Show();
    
    // Add new branch
    if(id % branchSpacing == 0 && id != 0)
    {
      float childSize = size/2 < voxelSize ? size : size/1.2;
      
      PVector leftBranchDir = direction.copy();
      leftBranchDir = leftBranchDir.rotate(HALF_PI).normalize();  
      PVector leftBranchPos = position.copy();
      
      tree.add(new Branch(leftBranchPos,leftBranchDir,childSize));
      
      PVector rightBranchDir = direction.copy();
      rightBranchDir = rightBranchDir.rotate(-HALF_PI).normalize(); 
      PVector rightBranchPos = position.copy();
      tree.add(new Branch(rightBranchPos,rightBranchDir,childSize));
    }
    
    
  }
  
  public boolean DoesCollide(Particle p)
  {
     return collisionGrid.get(p.position);
  }
}