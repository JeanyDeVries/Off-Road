class Collision
{
  boolean isTrue;
  
  boolean touchLeftBarrier;
  boolean touchRightBarrier;
  boolean touchTopBarrier;
  boolean touchDownBarrier;
  
  Collision()
  {
    isTrue = false;
  }
  
  boolean collidesWithRoad()
  {
    for (Road road : spawner.roads)
    {
    boolean leftInRoad = false;
    boolean rightInRoad = false;
    boolean topInRoad = false;
    boolean bottomInRoad = false;
    
    //check of de auto op de auto staat
    switch(road.type)
    {
      case STRAIGHT:
      
        if(car.x - car.size + car.rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x - car.size + car.rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        
        if (car.y > road.y - road.roadHeight / 2)
        {
          topInRoad = true;
        }
  
        if (car.y < road.y + road.roadHeight / 2)
        {
          bottomInRoad = true;
        }
        break;
        
      case SIDEWAYS:
      
        if(car.x - car.size + car.rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
    
        if(car.x - car.size + car.rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2 + road.barrierWidth)
        {
          topInRoad = true;
        }
    
        if (car.y < road.y + road.roadHeight / 2 - road.barrierWidth)
        {
          bottomInRoad = true;
        }
        break;
        
        
      case LEFT:
      
        if(car.x - car.size + car.rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
    
        if(car.x - car.size + car.rotate < road.x + road.roadWidth / 2 + road.barrierWidth)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2 + road.barrierWidth)
        {
          topInRoad = true;
        }
    
        if (car.y < road.y + road.roadHeight / 2)
        {
          bottomInRoad = true;
        }
        break;
      
      
      case LEFT_SIDE:
      
        if(car.x - car.size + car.rotate > road.x - road.roadWidth / 2 + road.barrierWidth)
        {
          leftInRoad = true;
        }
      
        if(car.x - car.size + car.rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2)
        {
          topInRoad = true;
        }
      
        if (car.y < road.y + road.roadHeight / 2 - road.barrierWidth)
        {
          bottomInRoad = true;
        }
        break;
      
      case RIGHT:
      
        if(car.x - car.size + car.rotate > road.x - road.roadWidth / 2 + road.barrierWidth)
        {
          leftInRoad = true;
        }
    
        if(car.x - car.size + car.rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2 + road.barrierWidth)
        {
          topInRoad = true;
          }
      
          if (car.y < road.y + road.roadHeight / 2)
          {
            bottomInRoad = true;
          }
          break;
        
        
        case RIGHT_SIDE:
        
          if(car.x - car.size + car.rotate > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
          }
      
          if(car.x - car.size + car.rotate < road.x + road.roadWidth / 2 + road.barrierWidth)
          {
            rightInRoad = true;
          }
          if (car.y > road.y - road.roadHeight / 2 - road.barrierWidth)
          {
            topInRoad = true;
          }
      
          if (car.y < road.y + road.roadHeight / 2)
          {
            bottomInRoad = true;
          }
          break;
        
        
        case OBSTACLE_HOLE:
        
          if(car.x - car.size + car.rotate > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
          }
          
          if(car.x - car.size + car.rotate < road.x + road.roadWidth / 2)
          {
            rightInRoad = true;
          }
          if (car.y > road.y - road.roadHeight / 2)
          {
            topInRoad = true;
          }
    
          if (car.y < road.y + road.roadHeight / 2)
          {
            bottomInRoad = true;
          }
          
          if(car.x > road.x - road.holeWidth/2 && car.x < road.x + road.holeWidth/2
              && car.y < road.y + road.holeHeight/2 && car.y > road.y - road.holeHeight/2)
          {
            car.alive = false;
          }
          break;
          
        
        case OBSTACLE_HOLE_SIDEWAYS:
        
          if(car.x - car.size + car.rotate > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
          }
      
          if(car.x - car.size + car.rotate < road.x + road.roadWidth / 2)
          {
            rightInRoad = true;
          }
          if (car.y > road.y - road.roadHeight / 2 + road.barrierWidth)
          {
            topInRoad = true;
          }
      
          if (car.y < road.y + road.roadHeight / 2 - road.barrierWidth)
          {
            bottomInRoad = true;
          }
          
          if(car.y > road.y - road.holeWidth/2 && car.y < road.y + road.holeWidth/2
              && car.x < road.x + road.holeHeight/2 && car.x > road.x - road.holeHeight/2)
          {
            car.alive = false;
          }
          break;
          
    }
    
      //check voor collision met de barriers van de road
      switch(road.type)
      {
        case STRAIGHT:

          if(!(car.x - car.size + car.rotate > road.x - road.roadWidth / 2))
          {
            road.touchLeftBarrier = true;
          }
          else
          {
            road.touchLeftBarrier = false;
          }
          
          if(!(car.x - car.size + car.rotate < road.x + road.roadWidth / 2))
          {
            road.touchRightBarrier = true;
          }
          else
          {
            road.touchRightBarrier = false;
          }
          break;
          
        case SIDEWAYS:
        
          if (!(car.y > road.y - road.roadHeight / 2 + road.barrierWidth))
          {
            road.touchTopBarrier = true;
          }
          else
          {
            road.touchTopBarrier = false;
          }
      
          if (!(car.y < road.y + road.roadHeight / 2 - road.barrierWidth))
          {
            road.touchDownBarrier = true;
          }
          else
          {
            road.touchDownBarrier = false;
          }
          break;
          
          
        case LEFT:
        
          if (!(car.y > road.y - road.roadHeight / 2 + road.barrierWidth))
          {
            road.touchTopBarrier = true;
          }
          else
          {
            road.touchTopBarrier = false;
          }
          
          if(!(car.x - car.size + car.rotate < road.x + road.roadWidth / 2))
          {
            road.touchRightBarrier = true;
          }
          else
          {
            road.touchRightBarrier = false;
          }
          break;
        
        
        case LEFT_SIDE:
        
          if(!(car.x - car.size + car.rotate > road.x - road.roadWidth / 2))
          {
            road.touchLeftBarrier = true;
          }
          else
          {
            road.touchLeftBarrier = false;
          }
          
          if (!(car.y < road.y + road.roadHeight / 2 - road.barrierWidth))
          {
            road.touchDownBarrier = true;
          }
          else
          {
            road.touchDownBarrier = false;
          }
          break;
        
        case RIGHT:
        
          if(!(car.x - car.size + car.rotate > road.x - road.roadWidth / 2))
          {
            road.touchLeftBarrier = true;
          }
          else
          {
            road.touchLeftBarrier = false;
          }
          
          if (!(car.y > road.y - road.roadHeight / 2 + road.barrierWidth))
          {
            road.touchTopBarrier = true;
          }
          else
          {
            road.touchTopBarrier = false;
          }
          break;
          
          
       case RIGHT_SIDE:
          
          if(!(car.x - car.size + car.rotate < road.x + road.roadWidth / 2))
          {
            road.touchRightBarrier = true;
          }
          else
          {
            road.touchRightBarrier = false;
          }
          
          if (!(car.y < road.y + road.roadHeight / 2 - road.barrierWidth))
          {
            road.touchDownBarrier = true;
          }
          else
          {
            road.touchDownBarrier = false;
          }
          break;
          
          
       case OBSTACLE_HOLE:
          
          if(!(car.x - car.size + car.rotate > road.x - road.roadWidth / 2))
          {
            road.touchLeftBarrier = true;
          }
          else
          {
            road.touchLeftBarrier = false;
          }
          
          if(!(car.x - car.size + car.rotate < road.x + road.roadWidth / 2))
          {
            road.touchRightBarrier = true;
          }
          else
          {
            road.touchRightBarrier = false;
          }
          break;
            
          
       case OBSTACLE_HOLE_SIDEWAYS:
          
          if (!(car.y > road.y - road.roadHeight / 2 + road.barrierWidth))
          {
            road.touchTopBarrier = true;
          }
          else
          {
            road.touchTopBarrier = false;
          }
      
          if (!(car.y < road.y + road.roadHeight / 2 - road.barrierWidth))
          {
            road.touchDownBarrier = true;
          }
          else
          {
            road.touchDownBarrier = false;
          }
          break;
            
    }
     
     if (leftInRoad && rightInRoad && topInRoad && bottomInRoad)
     {
       //Returnt alleen 'true' wanneer de auto op de road staat.
       isTrue = true;
       return true;
     }
      
       if(isTrue)
       {
          isTrue = false;
          return true;
       }
    }
    return false;
  }
}
