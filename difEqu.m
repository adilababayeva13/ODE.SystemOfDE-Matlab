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
fprintf('Eigenvalues of A are :\n ');
disp(eigs);
%eigenvalues
e1=eigs(1);
e2=eigs(2);

%checking cases

if isreal(e1)
   % 1) distinct real numbers
    if e1 ~= e2
       [V,D] = eig(A);
       V1=[V(1,1) ; V(2,1)];
       V2=[V(1,2) ; V(2,2)];
       disp("vector 1 : " );
       disp(V1);
       disp("vector 2 : " );
       disp(V2);
       fprintf(" Solution is : " );
       fprintf('C1[%f ; %f]e^%.ft + C2[%f ; %f ]e^%.ft',V1(1,1),V1(2,1) , e1 ,V2(1,1),V2(2,1) , e2);
    end
end
