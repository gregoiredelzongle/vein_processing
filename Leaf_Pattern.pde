// VARIABLES
public int seed = 0; // Seed used to randomize the pattern

public PVector initOrigin = new PVector(400,300); // Starting point
public int initialBranchAmount = 7; // Amount of branches in the first iteration
public float initSize = 5; // initial particle size

public int branchSpacing = 10; // spacing between children branches

public float noiseScale = 0.7f; // noise scale for the rotation
public float noiseIntensity = 45f; // max rotation allowed

public int voxelSize = 2; // collision detection factor


// INTERNAL VARIABLES
ArrayList<Branch> tree; //
CollisionGrid collisionGrid;
boolean canStart = false;

void setup()
{
  //Window configuration
  size(800,600);
  background(255);
  
  // Scene parameters
  frameRate(30);
  noiseSeed(seed);
  randomSeed(seed);
  
  //Particle configuration
  fill(0,0,0); // particle color
  noStroke();
  
  tree = new ArrayList<Branch>();
  collisionGrid = new CollisionGrid(voxelSize);
}

void init()
{
  for(int i = 0; i < initialBranchAmount; i++)
  {
    float initAngle = map(i,0,initialBranchAmount,0,TWO_PI);
    PVector initDirection = new PVector(0,1).rotate(initAngle);
    tree.add(new Branch(initOrigin,initDirection,initSize));
  }
}
void draw()
{
  if(!canStart)
    return;
  
  for(int i = 0; i < tree.size(); i++)
  {
    tree.get(i).Iterate();
  }
}

void mouseReleased()
{   
  initOrigin = new PVector(mouseX,mouseY);
  init();
  canStart = true;
}