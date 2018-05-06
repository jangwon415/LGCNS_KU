function clouds = PointCloud(X, Y, Z, filename)

points = automatedPoints(X,Y,Z);

%%
[faces, vertices] = stlread(filename);
fv = stlread(filename);
%% Render
% The model is rendered with a PATCH graphics object. We also add some dynamic
% lighting, and adjust the material properties to change the specular
% highlighting.

patch(fv,'FaceColor',       [0.8 0.8 1.0], ...
      'EdgeColor',       'none',        ...
      'FaceLighting',    'gouraud',     ...
      'AmbientStrength', 0.15);

% Add a camera light, and tone down the specular highlighting
camlight('headlight');
material('dull');

% Fix the axes scaling, and set a nice view angle
axis('image');
view([-135 35]);


in = PointInsideVolume(points, faces, vertices);

coors = [];
coors = [points(in, 1), points(in, 2), points(in, 3)];

% export the coordinates of points in the shape of input file
filename = 'coordsInDesiredShape.xlsx';
xlswrite(filename, coors)
