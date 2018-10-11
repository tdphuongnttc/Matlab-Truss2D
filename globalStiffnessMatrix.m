function [stiffness]=...
    globalStiffnessMatrix(gdof,nelem,...
    elemdata,nnode, node_coord,xx,yy,ndof);

 stiffness=zeros(gdof); 
 for i=1:nelem;
  indice=elemdata(i,1:2);      
  elementDof=[ indice(1)*2-1 indice(1)*2 indice(2)*2-1 indice(2)*2] ;
  xa=xx(indice(2))-xx(indice(1));
  ya=yy(indice(2))-yy(indice(1));
  length_element=sqrt(xa*xa+ya*ya);
  C=xa/length_element;
  S=ya/length_element; 
  T =[C S 0 0; 0 0 C S];
  k_lo = (elemdata(i,3)*elemdata(i,4)/length_element)*[1 -1;-1 1];
  Ke = T'*k_lo*T; 
   
       for ii=1:2*ndof
        for jj=1:2*ndof
          stiffness(elementDof(ii),elementDof(jj))=stiffness(elementDof(ii),elementDof(jj))+ Ke(ii,jj);
        end
       end   
     
end

