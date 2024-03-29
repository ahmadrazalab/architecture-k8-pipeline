document.getElementById("taskForm").addEventListener("submit", function (event) {
    event.preventDefault();

    const employeeName = document.getElementById("employeeName").value;
    const taskDescription = document.getElementById("taskDescription").value;
    const taskDate = document.getElementById("taskDate").value;

    const formData = {
        employeeName,
        taskDescription,
        taskDate,
    };

    fetch("add_task.php", {
        method: "POST",
        body: JSON.stringify(formData),
        headers: {
            "Content-Type": "application/json",
        },
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Task added successfully, refresh the task list
            fetchTasks();
            document.getElementById("taskForm").reset();
        } else {
            console.error("Failed to add task.");
        }
    });
});

function fetchTasks() {
    fetch("fetch_tasks.php")
        .then(response => response.json())
        .then(data => {
            const taskList = document.getElementById("taskList");
            taskList.innerHTML = ""; // Clear previous entries

            data.forEach(task => {
                const taskItem = document.createElement("div");
                taskItem.classList.add("task-item");
                taskItem.innerHTML = `
                    <p>${task.employee_name}<br> (${task.task_date})<br>
                    ${task.task_description}</p>
                    <button class="delete-button" data-id="${task.id}">Delete</button><hr style="border: 3px solid black;" id="my-hr" class="my-class" aria-label="Horizontal line across the page">
                `;
                taskList.appendChild(taskItem);
            });

            // Add event listeners to delete buttons
            const deleteButtons = document.querySelectorAll(".delete-button");
            deleteButtons.forEach(button => {
                button.addEventListener("click", deleteTask);
            });
        });
}

function deleteTask(event) {
    const taskId = event.target.getAttribute("data-id");

    fetch("delete_task.php", {
        method: "POST",
        body: JSON.stringify({ id: taskId }),
        headers: {
            "Content-Type": "application/json",
        },
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Task deleted successfully, refresh the task list
            fetchTasks();
        } else {
            console.error("Failed to delete task.");
        }
    });
}

// Fetch and display tasks when the page loads
fetchTasks();

