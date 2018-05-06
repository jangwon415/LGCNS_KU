function coors = automatedPoints(X, Y, Z)

% length of voxels in mm
x = 3;
y = x;
z = 1;

% length of the overlap of voxwels in mm
overlap = 1;

% empty space between voxels
space = x - 2*overlap;

k = floor(Z/z);

coors = [];

row = 1;
for z_coor = 0:k
    if rem(z_coor,2) == 0       % for odd-numbered layers
        for y_coor_even = 0:y+space:Y
            for x_coor_even = 0:x+space:X
                coors(row,1) = x_coor_even;
                coors(row,2) = y_coor_even;
                coors(row,3) = z_coor;
                row = row+1;
            end
        end
    else                        % for even-numbered layers
        for y_coor_odd = y-overlap:y+space:Y
            for x_coor_odd = x-overlap:x+space:X
                coors(row,1) = x_coor_odd;
                coors(row,2) = y_coor_odd;
                coors(row,3) = z_coor;
                row = row+1;
            end
        end
    end
end


% export the coordinates of points in a box container
 filename = 'coorsInBoxShape.xlsx';
 xlswrite(filename, coors)
