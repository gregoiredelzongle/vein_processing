//Used to quickly check collisions between particles by sampling them into a grid
public class CollisionGrid
{
  boolean[][] grid;
  int precision;
  int grid_width;
  int grid_height;
  
  public CollisionGrid(int precision)
  {
    this.precision = precision;
    grid_width = width/precision;
    grid_height = height/precision;
    
    grid = new boolean[grid_width][grid_height];
  }
  
  public void set(PVector pos, boolean state)
  {
    int x = int(pos.x/precision);
    int y = int(pos.y/precision);
    
    if( x >= grid_width || x < 0 || y >= grid_height || y < 0 )
    {
      return;
    }
    grid[x][y] = state;
  }
  
  public boolean get(PVector pos)
  {
    int x = int(pos.x/precision);
    int y = int(pos.y/precision);
    
    if( x >= grid_width || x < 0 || y >= grid_height || y < 0 )
    {
      return true;
    }
    
    return grid[x][y];
  }
}