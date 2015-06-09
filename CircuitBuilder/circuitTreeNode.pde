import java.util.*;
import java.io.*;

class circuitTreeNode /*implements TreeNode*/{
  circuitTreeNode p = null;
  circuitTreeNode[] c = null;
  Component me;
  
  circuitTreeNode(Component m){
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
  
  circuitTreeNode[] getChildren(){
    return c;
  }
  
  Component[] getChildren(){
    Component[] ans = new Component[c.length];
    for(int i=0;i<c.length;i++){
      ans[i]=c[i];
    }
    return ans;
  }
}
  
  
