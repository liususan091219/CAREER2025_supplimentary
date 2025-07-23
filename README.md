## Case Studies of Attack Types

We conducted a case study on all attack types separately:

---

### 1. **Long contextual evasion attack**

When many files were modified, the agent often ignored some code changes, causing vulnerabilities to be missed.  
Our case is at [PR](https://github.com/jiangrui-zheng/vant/pull/12). In this PR, we inserted dangerous code into `lib/utils/index.js`.  
As shown in the image below:

- **Injected vulnerability (current PR):**  
  ![type1.png](./type1.png)

- **It was detected in earlier PRs (before):**  
  ![type1_before.png](./type1_before.png)

---

### 2. **Security regression poison attack**

We used prompts to induce the agent to delete parts of the input validation.  
Our case is at [PR](https://github.com/jiangrui-zheng/vant/pull/103), where the input validation logic  
`if (filename.includes('..')) {` was suggested to be removed.

- **CodeRabbit’s suggestion:**  
  ![type2_coderabbit.jpg](./type2_coderabbit.jpg)

- **Copilot’s suggestion:**  
  ![type2_copilot.jpg](./type2_copilot.jpg)


