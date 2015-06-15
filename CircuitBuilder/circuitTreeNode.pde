import java.util.*;
import java.io.*;

class circuitTreeNode /*implements TreeNode*/{
  circuitTreeNode p = null;
  circuitTreeNode[] c = null;
  Component me;
  double circuitVoltageEffect;
  double circuitAmpEffect;
  
  circuitTreeNode(){
    circuitVoltageEffect = 1.0;
    circuitAmpEffect = 1.0;
  }
  
  circuitTreeNode(Component m){
    this();
    me = m;
  }
  
  circuitTreeNode(Component m, circuitTreeNode[] ch){
    this(m);
    c = ch;
  }
  
  circuitTreeNode(Component m, circuitTreeNode[] ch, circuitTreeNode pa){
    this(m, ch);
    p = pa;
  }
  
  Component getMe(){
    return me;
  }
  
  circuitTreeNode[] getChildren(){
    return c;
  }
  
  Component[] getChildrens(){
    Component[] ans = new Component[c.length];
    for(int i=0;i<c.length;i++){
      ans[i]=c[i].getMe();
    }
    return ans;
  }
  
  void addChildren(circuitTreeNode[] x){
    circuitTreeNode[] ch = Arrays.copyOf(c, c.length + x.length);
    for(int i=0;i<x.length;i++){
      ch[c.length + i] = x[i];
    }
    c=ch;
  }
  
  void setVoltEffect(double x){
    circuitVoltageEffect = x;
  }
  
  void setAmpEffect(double x){
    circuitAmpEffect = x;
  }
  
  double[] getEffect(){
    double[] pEffect = p.getEffect();
    pEffect[0] = pEffect[0] * circuitVoltageEffect;
    pEffect[1] = pEffect[1] * circuitAmpEffect;
    return pEffect;
  }
  
  boolean connected(Component x){
    for(circuitTreeNode z: c){
      if(z.getMe().equals(x)){
        return true;
      }
    }
    if(c.length == 0){
      return false;
    }
    boolean t = false;
    for(circuitTreeNode z: c){
      if(z.connected(x) == true){
        t = true;
      }
    }
    return t;
  }
  
  boolean connected(){
    return connected(me);
  }

}
