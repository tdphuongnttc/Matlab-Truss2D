function [rc,rf]=arrangeForce(gdof,bcDof,force)

activeDof=setdiff([1:gdof]',[bcDof]);
rf=force(activeDof);
rc=force(bcDof);