function [index3, index4] = Index3_Index4_VIS_Idx7( x1, y1, x2, y2, x0, y0 )
%   INDEX3_INDEX4 is the two indexes calculating the distance between the
%   valley (x0, y0) of part of the spectrum (reflectance) and the line passing through
%   two peaks (x1, y1) and (x2, y2) of the part of spectrum (reflectance).

%   The two peaks points are (x1, y1) and (x2, y2), the valley point is
%   (x0, y0), which are inputs. The outputs are two indexes, which are used
%   to identify blood from confusors (none-blood). Index3 is the vertical
%   distance between the line and the valley point. Index4 is the
%   orthogonal distance between the line and the valley point.

%   Attention that index3 and index4 might be very close. Use format long
%   to show more digits of their values.


format long;

index3 = ((y2-y1).*(x0-x1)./(x2-x1) + y1 - y0)./(y2);

index4 = ((y2-y1).*x0 - (x2-x1).*y0 + x2.*y1 - y2.*x1) ./ sqrt((y2-y1).^2 + (x2-x1).^2);


end

