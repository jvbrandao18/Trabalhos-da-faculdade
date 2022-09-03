import java.util.*;
 
class Main
{
    static int N = 42703;
 
    // To keep correct and reverse direction
    @SuppressWarnings("unchecked")
    static Vector<Integer>[] gr1 = new Vector[N];
    @SuppressWarnings("unchecked")
    static Vector<Integer>[] gr2 = new Vector[N];
 
    static boolean[] vis1 = new boolean[N];
    static boolean[] vis2 = new boolean[N];
 
    static {
        for (int i = 0; i < N; i++)
        {
            gr1[i] = new Vector<>();
            gr2[i] = new Vector<>();
        }
    }
 
    // Function to add edges
    static void Add_edge(int u, int v)
    {
        gr1[u].add(v);
        gr2[v].add(u);
    }
 
    // DFS function
    static void dfs1(int x)
    {
        vis1[x] = true;
        for (int i : gr1[x])
            if (!vis1[i])
                dfs1(i);
    }
 
    // DFS function
    static void dfs2(int x)
    {
        vis2[x] = true;
        for (int i : gr2[x])
            if (!vis2[i])
                dfs2(i);
    }
 
    static boolean Is_connected(int n)
    {
 
        // Call for correct direction
        Arrays.fill(vis1, false);
        dfs1(1);
 
        // Call for reverse direction
        Arrays.fill(vis2, false);
        dfs2(1);
 
        for (int i = 1; i <= n; i++)
        {
 
            // If any vertex it not visited in any direction
            // Then graph is not connected
            if (!vis1[i] && !vis2[i])
                return false;
        }
 
        // If graph is connected
        return true;
    }
 
    // Driver Code
    public static void main(String[] args)
    {
        int n = 4;
 
        // Add edges
        Add_edge(1, 22);
        Add_edge(1, 46 );
        Add_edge(1, 212 );
        Add_edge(1, 366 );
 
        // Function call
        if (Is_connected(n))
            System.out.println("Yes");
        else
            System.out.println("No");
    }
}
