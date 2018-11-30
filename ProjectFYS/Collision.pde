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
    
    road.touchLeftBarrier = false;
    road.touchRightBarrier = false;
    road.touchTopBarrier = false;
    road.touchDownBarrier = false;

    //check of de auto op de auto staat
    switch(road.type)
    {
      case STRAIGHT:
      
        if(car.x - car.size/2 + car.rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x - car.size*2 + car.rotate < road.x + road.roadWidth / 2)
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
        
          if(car.x - car.size/2 + car.rotate > road.x - road.roadWidth / 2)
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
    
          if(leftInRoad && rightInRoad && topInRoad && bottomInRoad)
          {
            return true;
          }
          
  //  if(leftInRoad && rightInRoad && topInRoad && bottomInRoad)
  //  {     
  //    //check voor collision met de barriers van de road
  //    //elke type road heeft de barriers op andere plaatsten staan, daarom de switch.
  //    switch(road.type)
  //    {
  //      case STRAIGHT:

  //        if(car.x - car.size <= road.x - road.roadWidth / 2)
  //        {
  //          road.touchLeftBarrier = true;
  //        }
          
  //        if(car.x + car.size >= road.x + road.roadWidth / 2)
  //        {
  //          road.touchRightBarrier = true;
  //        }
  //        break;
          
  //      case SIDEWAYS:
        
  //        if (car.y - car.size <= road.y - road.roadHeight / 2)
  //        {
  //          road.touchTopBarrier = true;
  //        }

  //        if (car.y + car.size >= road.y + road.roadHeight / 2)
  //        {
  //          road.touchDownBarrier = true;
  //        }
  //        break;
          
          
  //      case LEFT:
        
  //        if (car.y - car.size <= road.y - road.roadHeight / 2)
  //        {
  //          road.touchTopBarrier = true;
  //        }
          
  //        if(car.x + car.size >= road.x + road.roadWidth / 2)
  //        {
  //          road.touchRightBarrier = true;
  //        }
  //        break;
        
        
  //      case LEFT_SIDE:
        
  //        if(car.x - car.size <= road.x - road.roadWidth / 2)
  //        {
  //          road.touchLeftBarrier = true;
  //        }
          
  //        if (car.y + car.size >= road.y + road.roadHeight / 2)
  //        {
  //          road.touchDownBarrier = true;
  //        }
  //        break;
        
  //      case RIGHT:
        
  //        if(car.x - car.size <= road.x - road.roadWidth / 2)
  //        {
  //          road.touchLeftBarrier = true;
  //        }

  //        if (car.y - car.size <= road.y - road.roadHeight / 2)
  //        {
  //          road.touchTopBarrier = true;
  //        }

  //        break;
          
          
  //     case RIGHT_SIDE:
          
  //        if(car.x + car.size >= road.x + road.roadWidth / 2)
  //        {
  //          road.touchRightBarrier = true;
  //        }
          
  //        if (car.y + car.size >= road.y + road.roadHeight / 2)
  //        {
  //          road.touchDownBarrier = true;
  //        }
  //        break;
          
          
  //     case OBSTACLE_HOLE:
          
  //        if(car.x - car.size <= road.x - road.roadWidth / 2)
  //        {
  //          road.touchLeftBarrier = true;
  //        }
          
  //        if(car.x + car.size >= road.x + road.roadWidth / 2)
  //        {
  //          road.touchRightBarrier = true;
  //        }
  //        break;
            
          
  //     case OBSTACLE_HOLE_SIDEWAYS:
          
  //        if (car.y - car.size <= road.y - road.roadHeight / 2)
  //        {
  //          road.touchTopBarrier = true;
  //        }
      
  //        if (car.y + car.size >= road.y + road.roadHeight / 2)
  //        {
  //          road.touchDownBarrier = true;
  //        }
  //        break;
  //    } 
  //  }
     
     //if (road.touchDownBarrier || road.touchTopBarrier || road.touchRightBarrier || road.touchLeftBarrier)
     //{
     //    //Returnt alleen 'true' wanneer de auto op de road staat.
     //    return false;
     //}  
   }
    return false;
  }
}
  
  ////check of de car van de road af is
  ////de Road road in de () is de road die is verwijderdt. 
  //boolean isOffRoad(Road road)
  //{
  //  if(road.type == road.type.STRAIGHT)
  //  {
  //    if((car.y > road.y))
  //    {
  //      if(millis() - spawner.lifeSpanRoad > nieuweTijd)
  //      {
  //        return true;
  //      }
  //    }
  //  }  
    
  //  if(road.direction == road.direction.LEFT)
  //  {
  //    if((car.x > road.x - road.roadWidth) && (car.y < road.y - road.roadHeight))
  //    {
  //      if(millis() - spawner.lifeSpanRoad > nieuweTijd)
  //      {
  //        return true;
  //      }
  //    }
  //  }
    
  //  if(road.direction == road.direction.RIGHT)
  //  {
  //    if((car.x > road.x - road.roadWidth) && (car.y < road.y - road.roadHeight))
  //    {
  //      if(millis() - spawner.lifeSpanRoad > nieuweTijd)
  //      {
  //        return true;
  //      }
  //    }
  //  }
    
//    return false;
//    }
//  }
//}