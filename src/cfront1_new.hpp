X* p = new X(2); 

struct X * p = (struct X *) malloc(sizeof(struct X));
if (p == 0) error("memory exhausted");               
p->init(2);    