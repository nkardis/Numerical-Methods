clear all

Delta=0.1;
Lx=4.0;
Ly=3.0;

Ttop=30.0;
Tbottom=0.0;
Tleft=20;
Tright=10;
%%
x=0:Delta:Lx;
y=0:Delta:Ly;
nx=length(x)-1;
ny=length(y)-1;

[X,Y]=meshgrid(x,y);
phi=zeros(size(X));
%%
%
% Setting the Dirichlet Boundary Conditions
%
Ttop=30.0;
Tbottom=0.0;
Tleft=20;
Tright=10;
phi(:,1)=Tleft;phi(:,end)=Tright;phi(1,:)=Tbottom;phi(end,:)=Ttop;
%%
avgerror=1;

while avgerror>1.0e-6
    for j=2:ny
        for i=2:nx
            phi(j,i)=(phi(j-1,i)+phi(j+1,i)+phi(j,i-1)+phi(j,i+1))/4;
        end
    end
    
    avgerror=0.0;
    
    for j=2:ny
        for i=2:nx
            avgerror=avgerror+abs(4*phi(j,i)-(phi(j-1,i)+phi(j+1,i)+phi(j,i-1)+phi(j,i+1)));
        end
    end
    
    avgerror/(nx*ny)
end

[C,h]=contour(X,Y,phi,10,'linewidth',5)
clabel(C,h)
h.LevelList=round(h.LevelList,2)
xlabel('x','Fontsize',14);ylabel('y','Fontsize',14);