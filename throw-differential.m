clearvars;

% program to simulate the twisted throw with air resistance

%%% Parameters
drag = 0.11; % kg/m
mass = 550; % kg
grav = 9.82; % m/s^2
time = 1; % seconds

%%% initial levels
speed_initial = 6; % m/s
angle_initial = 90; % degrees

%%% Functions of t and x
dx1_dt = @(t,x) x(2);
dx2_dt = @(t,x) -(drag/mass)*sqrt(x(2)^2+x(4)^2)*x(2);
dx3_dt = @(t,x) x(4);
dx4_dt = @(t,x) -grav-(drag/mass)*sqrt(x(2)^2+x(4)^2)*x(4);

%%% Combined to one function
df_dt = @(t,x) [dx1_dt(t,x);
    dx2_dt(t,x);
    dx3_dt(t,x);
    dx4_dt(t,x)];

[t,y] = ode45(df_dt, [0 time], [0, speed_initial*cos(deg2rad(angle_initial)), 0, speed_initial*sin(deg2rad(angle_initial))]);

y_chosen = y(:,[1 3]);
%%% plotting functions
figure(1)
plot(t, y);
legend(["x", "dx", "y", "dy"]);
%legend(["x","y"]);
