function state=inv_Mix_columns(state)
State=state;
for a=1:4
    State(1,a)=bitxor(bitxor(bitxor(xtime(state(1,a),14),xtime(state(2,a),11)),xtime(state(3,a),13)),xtime(state(4,a),9));
    State(2,a)=bitxor(bitxor(bitxor(xtime(state(1,a),9),xtime(state(2,a),14)),xtime(state(3,a),11)),xtime(state(4,a),13));
    State(3,a)=bitxor(bitxor(bitxor(xtime(state(1,a),13),xtime(state(2,a),9)),xtime(state(3,a),14)),xtime(state(4,a),11));
    State(4,a)=bitxor(bitxor(bitxor(xtime(state(1,a),11),xtime(state(2,a),13)),xtime(state(3,a),9)),xtime(state(4,a),14));
end
   state=State;
end  