%% PIXEL DIRECTIONS CLASS %%

classdef PixelDirections
   enumeration
      TopLeft, TopCenter, TopRight, ...
      Left, Right, ...
      BottomLeft, BottomCenter, BottomRight,  ...
      None %No pixel found
   end
end

function findNeighbourPixelDirection(image, row, column)
    if (image(row-1, column) > 150)
        return PixelDirections.Left
    elseif (image(row-1, column-1) > 150)
        return PixelDirections.TopLeft
    elseif (image(row, column-1) > 150)
        return PixelDirections.TopCenter
    elseif (image(row+1, column-1) > 150)
        return PixelDirections.TopRight
    elseif (image(row+1, column) > 150)
        return PixelDirections.Right
    elseif (image(row+1, column+1) > 150)
        return PixelDirections.BottomRight
    elseif (image(row, column+1) > 150)
        return PixelDirections.BottomCenter
    elseif (image(row-1, column+1) > 150)
        return PixelDirections.BottomLeft
    else
        return PixelDirections.None
end

function CheckActivePixel(image, row, column, direction)
    switch(direction)
        case PixelDirections.TopLeft
            return (image(row-1, column-1) > 150)
        case PixelDirections.TopCenter
            return (image(row, column-1) > 150)
        case PixelDirections.TopRight
            return (image(row+1, column-1) > 150)
        case PixelDirections.Left
            return (image(row-1, column) > 150)
        case PixelDirections.Right
            return (image(row+1, column) > 150)
        case PixelDirections.BottomLeft
            return (image(row-1, column+1) > 150)
        case PixelDirections.BottomCenter
            return (image(row, column+1) > 150)
        case PixelDirections.BottomRight
            return (image(row+1, column+1) > 150)
    end
end

function PixelChecker(image, row, column, direction, depth)
   % Add error checking here
   switch(direction)
      case PixelDirections.TopLeft
          %Check if the topleft, center, or left pixel are active
           active = PixelChecker(image, row, column, PixelDirection.TopLeft)
           if (~(active))
               active = PixelChecker(image, row, column, PixelDirection.TopCenter)
               if (~(active))
                   active = PixelChecker(image, row, column, PixelDirection.Left)
               end
           end
           return active;
       case PixelDirections.TopCenter   
           %Check if the topleft, center, or topright pixel are active
           active = PixelChecker(image, row, column, PixelDirection.TopLeft)
           if (~(active))
               active = PixelChecker(image, row, column, PixelDirection.TopCenter)
               if (~(active))
                   active = PixelChecker(image, row, column, PixelDirection.TopRight)
               end
           end
           return active;
       case PixelDirections.TopRight 
           %Check if the topcenter, topright, right pixel are active
           active = PixelChecker(image, row, column, PixelDirection.TopCenter)
           if (~(active))
               active = PixelChecker(image, row, column, PixelDirection.TopRight)
               if (~(active))
                   active = PixelChecker(image, row, column, PixelDirection.Right)
               end
           end
           return active;
       case PixelDirections.Right 
           %Check if the Topright, right, bottomright pixel are active
           active = PixelChecker(image, row, column, PixelDirection.Right)
           if (~(active))
               active = PixelChecker(image, row, column, PixelDirection.TopRight)
               if (~(active))
                   active = PixelChecker(image, row, column, PixelDirection.BottomRight)
               end
           end
           return active;
           
        case PixelDirections.BottomRight 
           %Check if the right, bottomright, bottomcenter pixel are active
           active = PixelChecker(image, row, column, PixelDirection.Right)
           if (~(active))
               active = PixelChecker(image, row, column, PixelDirection.BottomCenter)
               if (~(active))
                   active = PixelChecker(image, row, column, PixelDirection.BottomRight)
               end
           end
           return active;
           
       case PixelDirections.BottomCenter 
           %Check if the bottomright, bottomcenter, bottomleft pixel are active
           active = PixelChecker(image, row, column, PixelDirection.BottomRight)
           if (~(active))
               active = PixelChecker(image, row, column, PixelDirection.BottomCenter)
               if (~(active))
                   active = PixelChecker(image, row, column, PixelDirection.BottomLeft)
               end
           end
           return active;
           
       case PixelDirections.BottomLeft 
           %Check if the bottomcenter, bottomleft, left pixel are active
           active = PixelChecker(image, row, column, PixelDirection.BottomCenter)
           if (~(active))
               active = PixelChecker(image, row, column, PixelDirection.BottomLeft)
               if (~(active))
                   active = PixelChecker(image, row, column, PixelDirection.Left)
               end
           end
           return active;
           
       case PixelDirections.Left 
           %Check if the bottomleft, left, topleft pixel are active
           active = PixelChecker(image, row, column, PixelDirection.BottomLeft)
           if (~(active))
               active = PixelChecker(image, row, column, PixelDirection.Left)
               if (~(active))
                   active = PixelChecker(image, row, column, PixelDirection.TopLeft)
               end
           end
           return active;
   end
end