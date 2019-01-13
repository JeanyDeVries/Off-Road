class Collision
{
  boolean tutorialFinished = false;
  boolean collisionOil = false;
  boolean oilRoad = false;
  boolean deathObstacle = false;

  Collision()  {

  }
  
  //Return een boolean die aangeeft of de auto binnen of buiten de weg zit.
  boolean collidesWithRoad()
  {
    frameCount = 0;
    
    for (Road road : spawner.roads)
    {
    boolean leftInRoad = false;
    boolean rightInRoad = false;
    boolean topInRoad = false;
    boolean bottomInRoad = false;
    oilRoad = false;

    //check of de auto op de weg staat
    switch(road.type)
    {
      case STRAIGHT_TUTORIAL_START:
      
        if(car.x> road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x  < road.x + road.roadWidth / 2)
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
       
     case STRAIGHT_TUTORIAL_ROTATE:
      
        if(car.x > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x < road.x + road.roadWidth / 2)
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
     
     case STRAIGHT_TUTORIAL_WARNING:
      
        if(car.x > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x < road.x + road.roadWidth / 2)
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
        
        tutorialFinished = true;
        break;
        
      case STRAIGHT:
      
        if(car.x > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x < road.x + road.roadWidth / 2)
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
      
        if(car.x > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
    
        if(car.x < road.x + road.roadWidth / 2)
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
      
        if(car.x > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
    
        if(car.x < road.x + road.roadWidth / 2 + road.barrierWidth)
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
      
        if(car.x > road.x - road.roadWidth / 2 + road.barrierWidth)
        {
          leftInRoad = true;
        }
      
        if(car.x < road.x + road.roadWidth / 2)
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
      
        if(car.x > road.x - road.roadWidth / 2 + road.barrierWidth)
        {
          leftInRoad = true;
        }
    
        if(car.x < road.x + road.roadWidth / 2)
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
        
          if(car.x > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
          }
      
          if(car.x < road.x + road.roadWidth / 2 + road.barrierWidth)
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
        
          if(car.x > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
          }
          
          if(car.x < road.x + road.roadWidth / 2)
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
        
          if(car.x > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
          }
      
          if(car.x < road.x + road.roadWidth / 2)
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
          
        case OBSTACLE_HOLE_SIDES:
        
          if(car.x > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
          }
          
          if(car.x < road.x + road.roadWidth / 2)
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
          
          //left hole collision
          if (car.x <= road.x -  road.holeSidesWidth
             && car.x >= road.x - road.roadWidth/2
             && car.y >= road.y - road.holeSidesHeight
             && car.y <= road.y + road.holeSidesHeight)
          {
            car.alive = false;
          }  
          
          //right hole collision
          if (car.x >= road.x + road.holeSidesWidth
             && car.x <= road.x + road.roadWidth/2
             && car.y >= road.y - road.holeSidesHeight
             && car.y <= road.y + road.holeSidesHeight)
          {
            car.alive = false;
          } 
          break;
        
        case OBSTACLE_HOLE_SIDES_SIDEWAYS:
        
          if(car.x > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
          }
      
          if(car.x < road.x + road.roadWidth / 2)
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
          
          //down hole collision
          if (car.y >= road.y +  road.holeSidesWidth
             && car.y <= road.y + road.roadHeight/2
             && car.x >= road.x - road.holeSidesHeight
             && car.x <= road.x + road.holeSidesHeight)
          {
            car.alive = false;
          }  
          
          //top hole collision
          if (car.y <= road.y - road.holeSidesWidth
             && car.y >= road.y - road.roadHeight/2
             && car.x >= road.x - road.holeSidesHeight
             && car.x <= road.x + road.holeSidesHeight)
          {
            car.alive = false;
          } 
          break;
        
        case OIL_STRAIGHT1:


        if(car.x > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x < road.x + road.roadWidth / 2)
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
          oilRoad = true;
        }

        if (car.x >= road.x - road.oilWidth  
            && car.x <= road.x 
            && car.y >= road.y - road.oilHeight/2 
            && car.y <= road.y + road.oilHeight/2)
        {
          collisionOil = true;
        }  

        break;

      case OIL_STRAIGHT2:

        if(car.x > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x < road.x + road.roadWidth / 2)
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
          oilRoad = true;
        }
        if (car.x <= road.x + road.oilWidth  &&
          car.x >= road.x &&
          car.y >= road.y - road.oilHeight/2 && 
          car.y <= road.y + road.oilHeight/2)
        {
          collisionOil = true;
        }
        break;
     
     case OIL_LEFT:
       if(car.x > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
    
        if(car.x < road.x + road.roadWidth / 2 + road.barrierWidth)
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
          oilRoad = true;
        }
        
        if (car.x >= road.x - road.oilLeftWidth &&
            car.x <= road.x - 7 &&
            car.y >= road.y - road.oilLeftHeight &&
            car.y >= road.y - 10)
            {
              collisionOil = true;
            }
        break;
        
     case OIL_RIGHT:
       if(car.x > road.x - road.roadWidth / 2 + road.barrierWidth)
        {
          leftInRoad = true;
        }
    
        if(car.x < road.x + road.roadWidth / 2)
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
         oilRoad = true;
       }
       if(car.x > road.x && 
           car.x < road.x + road.roadWidth/2 && 
           car.y > road.y - road.roadHeight/2 && 
           car.y < road.y)
       {
         collisionOil = true;
       }
       break;
          
     case OIL_LEFT_SIDE:
       if(car.x > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
          }
      
          if(car.x < road.x + road.roadWidth / 2 + road.barrierWidth)
          {
            rightInRoad = true;
            oilRoad = true;
          }
          if (car.y > road.y - road.roadHeight / 2 - road.barrierWidth)
          {
            topInRoad = true;
          }
      
          if (car.y < road.y + road.roadHeight / 2)
          {
            bottomInRoad = true;
          }
          if(car.x < road.x && 
              car.x > road.x - road.roadWidth/2 && 
              car.y > road.y - road.roadHeight/2 && 
              car.y < road.y)
          {
            collisionOil = true;
          }
          break;
        
    case OIL_RIGHT_SIDE:
    
      if(car.x > road.x - road.roadWidth / 2)
          {
            leftInRoad = true;
            oilRoad = true;
          }
      
          if(car.x < road.x + road.roadWidth / 2 + road.barrierWidth)
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
          if(car.x > road.x && 
              car.x < road.x + road.roadWidth/2 && 
              car.y > road.y - road.roadHeight/2 && 
              car.y < road.y)
          {
            collisionOil = true;
          }
          break;
   }    
       
       if(leftInRoad && rightInRoad && topInRoad && bottomInRoad)
       {
         return true;
       }

   }
    return false;
   }
   
   boolean spawnRoad(Road road)
   {
     //Als de auto collided met het begin gedeelte van de road, wordt de boolean true.
     //Hiermee wordt later een weg gespawned.
     switch(road.type)
     {
       case LEFT_SIDE:
         if(car.x < road.x + road.roadWidth/2 && car.x > road.x)
         {
           return true;
         }
         break;
      
       case RIGHT_SIDE:
         if(car.x > road.x - road.roadWidth/2 && car.x < road.x)
         {
           return true;
         }
         break;
         
      case LEFT:
        if(car.y < car.y + road.roadHeight/2 && car.y > road.y)
         {
           return true;
         }
        break;
        
     case RIGHT:
         if(car.y < car.y + road.roadHeight/2 && car.y > road.y)
         {
           return true;
         }
         break;
         
     case OIL_LEFT_SIDE:
         if(car.x < road.x + road.roadWidth/2 && car.x > road.x)
         {
           return true;
         }
         break;
      
       case OIL_RIGHT_SIDE:
         if(car.x > road.x - road.roadWidth/2 && car.x < road.x)
         {
           return true;
         }
         break;
         
      case OIL_LEFT:
        if(car.y < car.y + road.roadHeight/2 && car.y > road.y)
         {
           return true;
         }
        break;
        
     case OIL_RIGHT:
         if(car.y < car.y + road.roadHeight/2 && car.y > road.y)
         {
           return true;
         }
         break;
     }
     
     switch(road.direction)
     {
       case STRAIGHT:
         if((car.y < road.y + road.roadHeight/4) && (car.y > road.y - road.roadHeight/4) && tutorialFinished)
         {
           return true;
         }
         break;
         
       case LEFT:
         if((car.x < road.x + road.roadWidth/2) && (car.x > road.x) && tutorialFinished)
         {
           return true;
         }
         break;
         
       case RIGHT:
         if((car.x > road.x - road.roadWidth/2) && (car.x < road.x) && tutorialFinished)
         {
           return true;
         }
         break;
     }
 
     return false;
   }
}
