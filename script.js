const campoCnpj = document.querySelector('#cnpj');

if (campoCnpj) {
    campoCnpj.addEventListener('input', () => {
        const numeros = campoCnpj.value.replace(/\D/g, '').slice(0, 14);
        let formatado = numeros;

        if (numeros.length > 2) {
            formatado = `${numeros.slice(0, 2)}.${numeros.slice(2)}`;
        }
        if (numeros.length > 5) {
            formatado = `${numeros.slice(0, 2)}.${numeros.slice(2, 5)}.${numeros.slice(5)}`;
        }
        if (numeros.length > 8) {
            formatado = `${numeros.slice(0, 2)}.${numeros.slice(2, 5)}.${numeros.slice(5, 8)}/${numeros.slice(8)}`;
        }
        if (numeros.length > 12) {
            formatado = `${numeros.slice(0, 2)}.${numeros.slice(2, 5)}.${numeros.slice(5, 8)}/${numeros.slice(8, 12)}-${numeros.slice(12)}`;
        }

        campoCnpj.value = formatado;
    });
}
