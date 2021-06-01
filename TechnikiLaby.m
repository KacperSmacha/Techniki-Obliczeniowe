format long
a = linspace(-1,2,50);
b = linspace(-1,2,50);
[aa,bb] = meshgrid(a,b);
cc = aa;
for i = 1:50
    for j = 1:50
        cc(i,j) = chi(aa(i,j),bb(i,j));
    end
end
mesh(aa,bb,cc);

fun = @root2d;
x0 = [0,0];
x = fsolve(fun,x0)

hold all
plot3(x(1),x(2),chi(x(1),x(2)),'*r')
plot3(0,0,chi(0,0),'*g')

function F = root2d(x)
    F(1) = x(1).*x(2) - x(1).^3 + x(2).^4 + cos(x(1)) - 5;
    F(2) = x(1) + sqrt(x(2)) - sin(x(1).*x(2).^2) - 1;
end 

function Y = chi(x1,x2)
    x = [x1,x2];
    F = root2d(x);
    Y = abs(F(1)).^2 + abs(F(2)).^2;
end