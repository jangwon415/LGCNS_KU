function clouds = pointCloud(X, Y, Z, filename)

%%
%x = 80;
%y = 80;
%z = 200;

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

%%
 in = PointInsideVolume(points, faces, vertices);
% clf;
% trisurf(faces,vertices(:,1),vertices(:,2),vertices(:,3), ...
%        'FaceColor','yellow','FaceAlpha', 0.2);
% hold on
% scatter3(points( in,1), points( in,2), points( in,3),30, 'r', 'fill');
% %scatter3(points(~in,1), points(~in,2), points(~in,3), 3, 'b', 'fill');
% legend({'volume', 'points inside', 'points outside'}, 'Location', 'southoutside')
% 

%%

coors=[];

coors = [points(in, 1), points(in, 2), points(in, 3)];



filename = 'points1.xlsx';
xlswrite(filename, coors)


