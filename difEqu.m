% getting values
x1 = input("Please enter the coefficient of x in the first equation: ");
y1 = input("Please enter the coefficient of y in the first equation: ");
x2 = input("Please enter the coefficient of x in the second equation: ");
y2 = input("Please enter the coefficient of y in the second equation: ");

%find eigenvalues
A = [ x1 y1 ; x2 y2];
eigs = eig(A);
fprintf('A matrix is :\n ');
disp(A);
I=eye(2);
%eigenvalues
e1=eigs(1,1);
e2=eigs(2,1);
disp(" first eigenvalue is : ");
disp(e1);
disp(" second eigenvalue is : ");
disp(e2);
%checking cases

if isreal(e1)
   % 1) Repeated roots  
    if abs(e1-e2) < 0.0001 % because they're floating point, we need to check against a tolerance
       [V,D] = eig(A);
       A2 = A - e1*I;
       V1=[V(1,1) ; V(2,1)];
       V2 = linsolve(A2,V1); % because A2*V2=V1
       disp("vector 1 : " );
       disp(V1);
       disp("vector 2 : " );
       disp(V2);
       fprintf(" Solution is : " );
       fprintf('C1(%f ; %f)e^%.ft + C2[(%f ; %f )te^%.ft + (%f ; %f )e^%.ft',V1(1,1),V1(2,1) , e1 ,V1(1,1),V1(2,1) , e1 ,V2(1,1),V2(2,1) , e1);
 
    % 2) distinct real roots
    else
       [V,D] = eig(A);
       V1=[V(1,1) ; V(2,1)];
       V2=[V(1,2) ; V(2,2)];
       disp("vector 1 : " );
       disp(V1);
       disp("vector 2 : " );
       disp(V2);
       fprintf(" Solution is : " );
       fprintf('C1(%f ; %f)e^%.ft + C2(%f ; %f )e^%.ft',V1(1,1),V1(2,1) , e1 ,V2(1,1),V2(2,1) , e2);
    end
else
       [V,D] = eig(A);
       real_eig = real(e1);
       img_eig = imag(e1);
       V1=[V(1,1) ; V(2,1)];
       disp("vector: " );
       disp(V1);
       Vreal1=real(V1(1));
       Vreal2=real(V1(2));
       Vimg1 = imag(V1(1)) ;
       Vimg2 = imag(V1(2)) ;
       fprintf(" Solution is : \n" );
  fprintf('X1(t) = e^%.ft(cos%.ft[%f , %f]-sin%.ft[%f , %f])\n',real_eig,img_eig,Vreal1,Vreal2,img_eig,Vimg1,Vimg2);
  fprintf('X2(t) = e^%.ft(cos%.ft[%f , %f]+sin%.ft[%f , %f])\n',real_eig,img_eig,Vimg1,Vimg2,img_eig,Vreal1,Vreal2);    
end
    
