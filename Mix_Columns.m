function state=MixColumns(state)
State=state;
for a=1:4
    State(1,a)=bitxor(bitxor(bitxor(xtime(state(1,a),2),xtime(state(2,a),3)),state(3,a)),state(4,a));
    State(2,a)=bitxor(bitxor(bitxor(xtime(state(1,a),1),xtime(state(2,a),2)),xtime(state(3,a),3)),state(4,a));
    State(3,a)=bitxor(bitxor(bitxor(xtime(state(1,a),1),xtime(state(2,a),1)),xtime(state(3,a),2)),xtime(state(4,a),3));
    State(4,a)=bitxor(bitxor(bitxor(xtime(state(1,a),3),xtime(state(2,a),1)),state(3,a)),xtime(state(4,a),2));
end
   state=State;
end  