const tds = document.querySelectorAll("td[data-click]")

tds.forEach(el => {
    el.addEventListener("click", e => {
        const id = e.target.dataset.id
        console.log('id :>> ', id);
        
        if(id)
        {
            const td = document.querySelector(`[data-id='${id}']`)
            const tdsToUncheck = document.querySelectorAll(`.clicked`)
            const checkbox = document.querySelector(`[data-input-id='${id}']`)
            const checkboxToUncheck = document.querySelectorAll(`[data-input-id]`)

            console.log('checkbox :>> ', checkbox);

            if (td.dataset.empty == 1 && td.dataset.teacher == 0) {                
                tdsToUncheck.forEach(element => {
                    element.classList.remove('clicked')
                })
                checkboxToUncheck.forEach(element => {
                    element.checked = false
                })
    
    
                if(td.classList.contains('clicked'))
                {
                    checkbox.checked = false
                } else {
                    
                    checkbox.checked = true
                }
    
                td.classList.toggle('clicked')
            }
        }
    })
})


/* ciasteczko */

