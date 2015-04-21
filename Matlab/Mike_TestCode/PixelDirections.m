%% PIXEL DIRECTIONS CLASS %%
classdef PixelDirections
   enumeration
      TopLeft, TopCenter, TopRight, ...
      Left, Right, ...
      BottomLeft, BottomCenter, BottomRight,  ...
      None %No pixel found
   end
   methods(Static)
       function newPixelDirection = findNeighbourPixelDirection(image, row, column)
           [rows, columns, ~] = size(image);
            if (row == 1)
                if (column == 1)
                    %Only check right, bottomright, bottomcenter
                    if (image(row+1, column) > 150)
                        newPixelDirection = PixelDirections.Right;
                    elseif (image(row+1, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomRight;
                    elseif (image(row, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomCenter;
                    else
                        newPixelDirection = PixelDirections.None;
                    end
                elseif (column == columns)
                    %Only check right, topright, topcenter
                    if (image(row, column-1) > 150)
                        newPixelDirection = PixelDirections.TopCenter;
                    elseif (image(row+1, column-1) > 150)
                        newPixelDirection = PixelDirections.TopRight;
                    elseif (image(row+1, column) > 150)
                        newPixelDirection = PixelDirections.Right;
                    else
                        newPixelDirection = PixelDirections.None;
                    end
                else
                    %Only check right, bottomright, bottomcenter, topright, topcenter
                    if (image(row, column-1) > 150)
                        newPixelDirection = PixelDirections.TopCenter;
                    elseif (image(row+1, column-1) > 150)
                        newPixelDirection = PixelDirections.TopRight;
                    elseif (image(row+1, column) > 150)
                        newPixelDirection = PixelDirections.Right;
                    elseif (image(row+1, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomRight;
                    elseif (image(row, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomCenter;
                    else
                        newPixelDirection = PixelDirections.None;
                    end
                end
            elseif (row == rows)
                if (column == 1)
                    %Only check left, bottomleft, bottomcenter
                    if (image(row-1, column) > 150)
                        newPixelDirection = PixelDirections.Left;
                    elseif (image(row, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomCenter;
                    elseif (image(row-1, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomLeft;
                    else
                        newPixelDirection = PixelDirections.None;
                    end
                elseif (column == columns)
                    %Only check left, topleft, topcenter
                    if (image(row-1, column) > 150)
                        newPixelDirection = PixelDirections.Left;
                    elseif (image(row-1, column-1) > 150)
                        newPixelDirection = PixelDirections.TopLeft;
                    elseif (image(row, column-1) > 150)
                        newPixelDirection = PixelDirections.TopCenter;
                    else
                        newPixelDirection = PixelDirections.None;
                    end
                else
                    %Only check left, bottomleft, bottomcenter, topleft,
                    %topcenter
                    if (image(row-1, column) > 150)
                        newPixelDirection = PixelDirections.Left;
                    elseif (image(row-1, column-1) > 150)
                        newPixelDirection = PixelDirections.TopLeft;
                    elseif (image(row, column-1) > 150)
                        newPixelDirection = PixelDirections.TopCenter;
                    elseif (image(row, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomCenter;
                    elseif (image(row-1, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomLeft;
                    else
                        newPixelDirection = PixelDirections.None;
                    end
                end
            else
                if (column == 1)
                    %Only check left, bottomleft, bottomcenter,
                    %bottomright, right
                    if (image(row-1, column) > 150)
                        newPixelDirection = PixelDirections.Left;
                    elseif (image(row+1, column) > 150)
                        newPixelDirection = PixelDirections.Right;
                    elseif (image(row+1, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomRight;
                    elseif (image(row, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomCenter;
                    elseif (image(row-1, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomLeft;
                    else
                        newPixelDirection = PixelDirections.None;
                    end
                elseif (column == columns)
                    %Only check left, topleft, topcenter, topright, right
                    if (image(row-1, column) > 150)
                        newPixelDirection = PixelDirections.Left;
                    elseif (image(row-1, column-1) > 150)
                        newPixelDirection = PixelDirections.TopLeft;
                    elseif (image(row, column-1) > 150)
                        newPixelDirection = PixelDirections.TopCenter;
                    elseif (image(row+1, column-1) > 150)
                        newPixelDirection = PixelDirections.TopRight;
                    elseif (image(row+1, column) > 150)
                        newPixelDirection = PixelDirections.Right;
                    else
                        newPixelDirection = PixelDirections.None;
                    end
                else
                    %Check everything
                    if (image(row-1, column) > 150)
                        newPixelDirection = PixelDirections.Left;
                    elseif (image(row-1, column-1) > 150)
                        newPixelDirection = PixelDirections.TopLeft;
                    elseif (image(row, column-1) > 150)
                        newPixelDirection = PixelDirections.TopCenter;
                    elseif (image(row+1, column-1) > 150)
                        newPixelDirection = PixelDirections.TopRight;
                    elseif (image(row+1, column) > 150)
                        newPixelDirection = PixelDirections.Right;
                    elseif (image(row+1, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomRight;
                    elseif (image(row, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomCenter;
                    elseif (image(row-1, column+1) > 150)
                        newPixelDirection = PixelDirections.BottomLeft;
                    else
                        newPixelDirection = PixelDirections.None;
                    end
                end
            end
       end
       
       function [isActive, nextRow, nextCol] = CheckActivePixel(image, row, column, direction)
            switch(direction)
                case PixelDirections.TopLeft
                    isActive = (image(row-1, column-1) > 150);
                    nextRow = row - 1;
                    nextCol = column - 1;
                case PixelDirections.TopCenter
                    isActive = (image(row, column-1) > 150);
                    nextRow = row;
                    nextCol = column - 1;
                case PixelDirections.TopRight
                    isActive = (image(row+1, column-1) > 150);
                    nextRow = row + 1;
                    nextCol = column - 1;
                case PixelDirections.Left
                    isActive = (image(row-1, column) > 150);
                    nextRow = row - 1;
                    nextCol = column;
                case PixelDirections.Right
                    isActive = (image(row+1, column) > 150);
                    nextRow = row + 1;
                    nextCol = column;
                case PixelDirections.BottomLeft
                    isActive = (image(row-1, column+1) > 150);
                    nextRow = row - 1;
                    nextCol = column + 1;
                case PixelDirections.BottomCenter
                    isActive = (image(row, column+1) > 150);
                    nextRow = row;
                    nextCol = column + 1;
                case PixelDirections.BottomRight
                    isActive = (image(row+1, column+1) > 150);
                    nextRow = row + 1;
                    nextCol = column + 1;
            end
       end
        
       function didFind = PixelChecker(image, row, column, direction, depth)
           %Base case
           if (depth == 0)
               didFind = 1;
               return;
           end
           % Add error checking here
           switch(direction)
              case PixelDirections.TopLeft
                  %Check if the topleft, center, or left pixel are active
                   [active, nextRow, nextCol] = CheckActivePixel(image, row, column, PixelDirection.TopLeft);
                   if (~(active))
                       [active, nextRow, nextCol] = CheckActivePixel(image, row, column, PixelDirection.TopCenter);
                       if (~(active))
                           [active, nextRow, nextCol] = CheckActivePixel(image, row, column, PixelDirection.Left);
                       end
                   end
                   didFind = active && PixelChecker(image, nextRow, nextCol, direction);
               case PixelDirections.TopCenter   
                   %Check if the topleft, center, or topright pixel are active
                   [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.TopLeft);
                   if (~(active))
                       [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.TopCenter);
                       if (~(active))
                           [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.TopRight);
                       end
                   end
                   didFind = active && PixelChecker(image, nextRow, nextCol, direction);;
               case PixelDirections.TopRight 
                   %Check if the topcenter, topright, right pixel are active
                   [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.TopCenter);
                   if (~(active))
                       [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.TopRight);
                       if (~(active))
                           [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.Right);
                       end
                   end
                   didFind = active && PixelChecker(image, nextRow, nextCol, direction);;
               case PixelDirections.Right 
                   %Check if the Topright, right, bottomright pixel are active
                   [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.Right);
                   if (~(active))
                       [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.TopRight);
                       if (~(active))
                           [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.BottomRight);
                       end
                   end
                   didFind = active && PixelChecker(image, nextRow, nextCol, direction);;

                case PixelDirections.BottomRight 
                   %Check if the right, bottomright, bottomcenter pixel are active
                   [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.Right);
                   if (~(active))
                       [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.BottomCenter);
                       if (~(active))
                           [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.BottomRight);
                       end
                   end
                   didFind = active && PixelChecker(image, nextRow, nextCol, direction);;

               case PixelDirections.BottomCenter 
                   %Check if the bottomright, bottomcenter, bottomleft pixel are active
                   [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.BottomRight);
                   if (~(active))
                       [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.BottomCenter);
                       if (~(active))
                           [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.BottomLeft);
                       end
                   end
                   didFind = active && PixelChecker(image, nextRow, nextCol, direction);;

               case PixelDirections.BottomLeft 
                   %Check if the bottomcenter, bottomleft, left pixel are active
                   [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.BottomCenter);
                   if (~(active))
                       [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.BottomLeft);
                       if (~(active))
                           [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.Left);
                       end
                   end
                   didFind = active && PixelChecker(image, nextRow, nextCol, direction);;

               case PixelDirections.Left 
                   %Check if the bottomleft, left, topleft pixel are active
                   [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.BottomLeft);
                   if (~(active))
                       [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.Left);
                       if (~(active))
                           [active, nextRow, nextCol] = PixelChecker(image, row, column, PixelDirection.TopLeft);
                       end
                   end
                   didFind = active && PixelChecker(image, nextRow, nextCol, direction);;
           end
       end
   end
end