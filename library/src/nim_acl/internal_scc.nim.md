---
layout: default
---

<!-- mathjax config similar to math.stackexchange -->
<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML">
</script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    TeX: { equationNumbers: { autoNumber: "AMS" }},
    tex2jax: {
      inlineMath: [ ['$','$'] ],
      processEscapes: true
    },
    "HTML-CSS": { matchFontHeight: false },
    displayAlign: "left",
    displayIndent: "2em"
  });
</script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-balloon-js@1.1.2/jquery.balloon.min.js" integrity="sha256-ZEYs9VrgAeNuPvs15E39OsyOJaIkXEEt10fzxJ20+2I=" crossorigin="anonymous"></script>
<script type="text/javascript" src="../../../assets/js/copy-button.js"></script>
<link rel="stylesheet" href="../../../assets/css/copy-button.css" />


# :warning: src/nim_acl/internal_scc.nim

<a href="../../../index.html">Back to top page</a>

* category: <a href="../../../index.html#9445bba494c2e7790206eaaedbe1a4db">src/nim_acl</a>
* <a href="{{ site.github.repository_url }}/blob/master/src/nim_acl/internal_scc.nim">View this file on GitHub</a>
    - Last commit date: 2020-09-10 22:39:22+09:00




## Code

<a id="unbundled"></a>
{% raw %}
```cpp
when not defined ATCODER_INTERNAL_SCC_HPP:
  const ATCODER_INTERNAL_SCC_HPP = 1
  
  import sequtils
  
  type csr[E] = object
    start:seq[int]
    elist:seq[E]
  proc initCsr[E](n:int, edges:seq[(int,E)]):auto =
    var
      start = newSeq[int](n + 1)
      elist = newSeq[E](edges.len)
    for e in edges:
      start[e[0] + 1].inc
    for i in 1..n:
      start[i] += start[i - 1]
    var counter = start
    for e in edges:
      elist[counter[e[0]]] = e[1]
      counter[e[0]].inc
    return csr[E](start:start, elist:elist)
  
  type edge = object
    dst:int
  # Reference:
  # R. Tarjan,
  # Depth-First Search and Linear Graph Algorithms
  type internal_scc_graph* = object
    n:int
    edges:seq[(int,edge)]

  proc init_internal_scc_graph*(n:int):auto = internal_scc_graph(n:n, edges:newSeq[(int,edge)]())
  
  proc num_vertices*(self: internal_scc_graph):int =  self.n

  proc add_edge*(self: var internal_scc_graph, src, dst:int) = self.edges.add((src, edge(dst:dst)))

  # @return pair of (# of scc, scc id)
  proc scc_ids*(self: internal_scc_graph):(int,seq[int]) =
    var g = initCsr[edge](self.n, self.edges)
    var now_ord, group_num = 0
    var
      visited = newSeqOfCap[int](self.n)
      low = newSeq[int](self.n)
      ord = newSeqWith(self.n, -1)
      ids = newSeq[int](self.n)
    proc dfs(v:int) =
      low[v] = now_ord
      ord[v] = now_ord
      now_ord.inc
      visited.add(v)
      for i in g.start[v] ..< g.start[v + 1]:
        let dst = g.elist[i].dst
        if ord[dst] == -1:
          dfs(dst)
          low[v] = min(low[v], low[dst])
        else:
          low[v] = min(low[v], ord[dst])
      if low[v] == ord[v]:
        while true:
          let u = visited[^1]
          discard visited.pop()
          ord[u] = self.n
          ids[u] = group_num
          if u == v: break
        group_num.inc
    for i in 0..<self.n:
      if ord[i] == -1: dfs(i)
    ids.applyIt(group_num - 1 - it)
    return (group_num, ids)

  proc scc*(self: internal_scc_graph):auto =
    let
      ids = self.scc_ids()
      group_num = ids[0]
    var counts = newSeq[int](group_num)
    for x in ids[1]: counts[x].inc
    result = newSeq[seq[int]](ids[0])
    for i in 0..<group_num:
      result[i] = newSeqOfCap[int](counts[i])
    for i in 0..<self.n:
      result[ids[1][i]].add(i)

#endif  // ATCODER_INTERNAL_SCC_HPP

```
{% endraw %}

<a id="bundled"></a>
{% raw %}
```cpp
Traceback (most recent call last):
  File "/opt/hostedtoolcache/Python/3.8.5/x64/lib/python3.8/site-packages/onlinejudge_verify/docs.py", line 349, in write_contents
    bundled_code = language.bundle(self.file_class.file_path, basedir=pathlib.Path.cwd())
  File "/opt/hostedtoolcache/Python/3.8.5/x64/lib/python3.8/site-packages/onlinejudge_verify/languages/nim.py", line 86, in bundle
    raise NotImplementedError
NotImplementedError

```
{% endraw %}

<a href="../../../index.html">Back to top page</a>

