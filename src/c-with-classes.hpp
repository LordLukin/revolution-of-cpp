class stack {
    char s[SIZE]; /* array of characters */
    char * min;   /* pointer to bottom of stack */
    char * top;   /* pointer to top of stack */
    char * max;   /* pointer to top of allocated space */
    void new();   /* initialization function (constructor) */
    public:
    void push(char);
    char pop();
};
char stack.pop()    // member functions always defined "elsewhere", not in class definition
{                   // dot operator instead of double colon
    if (top <= min) error("stack underflow");
    return *(--top);
}
class stack s1, s2; /* two variables of class stack, class was mandatory for declaration */
class stack * p1 = &s2; /* p1 points to s2 */
class stack * p2 = new stack; /* p2 points to stack object allocated on free store */
s1.push('h'); /* use object directly */
p1->push('s'); /* use object through pointer */