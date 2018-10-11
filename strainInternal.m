function strainInternal(nelem,elemdata,U,xx,yy)
%% calculate internal stress
%strain : deformation
% U: displacement
  
for i=1:nelem                       
  indice=elemdata(i, 1:2);
  elementDof=[ indice(1)*2-1 indice(1)*2 indice(2)*2-1 indice(2)*2] ;
  xa=xx(indice(2))-xx(indice(1));
  ya=yy(indice(2))-yy(indice(1));
  length_element=sqrt(xa*xa+ya*ya);
  C=xa/length_element;
  S=ya/length_element; 
  T =[C S 0 0; 0 0 C S];
  strainInternal(i)=[-1/length_element 1/length_element]*T*U(elementDof); 
end
disp('internal strain')
jj=1:nelem ; format long
[jj' strainInternal']